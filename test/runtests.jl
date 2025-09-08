using SemaDbAPI
using Test
using HTTP
using JSON3
using Dates
using UUIDs
using OpenAPI
using Aqua

# Test configuration
const TEST_BASE_URL = "http://localhost:8081/v2"
const TEST_USER_ID = "testuser"

const TEST_COLLECTION_ID = "testcollection"
# Check if SemaDB is running before running tests
function check_sema_db_running()
    try
        HTTP.get("http://localhost:8081/healthz")
        return true
    catch e
        @warn "SemaDB is not running at http://localhost:8081. Tests requiring a running instance will be skipped."
        return false
    end
end

const SEMADB_RUNNING = check_sema_db_running()

@testset "SemaDbAPI.jl" begin
    # ======================
    # Code Quality Tests
    # ======================
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(SemaDbAPI;
            ambiguities = true,
            project_extras = true,
            deps_compat = true,
            stale_deps = true,
            piracies = true,
            unbound_args = true
        )
    end

    @testset "Client Initialization" begin
        # Test valid URL
        client = SemaDBClient(TEST_BASE_URL)
        @test client.base_url == TEST_BASE_URL
        @test isnothing(client.api_key)


        # Test valid URL with API key
        client = SemaDBClient(TEST_BASE_URL, api_key = "test-key")
        @test client.base_url == TEST_BASE_URL
        @test client.api_key == "test-key"


        # Test invalid URL
        @test_throws ArgumentError SemaDBClient("invalid-url")
    end

    # Only run these tests if SemaDB is running
    if SEMADB_RUNNING
        client = SemaDBClient(TEST_BASE_URL)
        @testset "Point Operations" begin
            

            @testset "Create Collection" begin
                # Valid vector collection
                ivvp = IndexVectorVamanaParameters(
                    vectorSize = 2,
                    distanceMetric = "euclidean",
                    searchSize = 75,
                    degreeBound = 64,
                    alpha = 1.2
                )

                ischema = Dict("vector" => IndexSchemaValue(
                    type = "vectorVamana",
                    vectorVamana = ivvp
                ))

                req = CreateCollectionRequest(
                    id = TEST_COLLECTION_ID,
                    indexSchema = ischema
                )

                res = create_collection(client, TEST_USER_ID, req)
                @test res isa InlineObject
                @test res.message == "collection created"

                # Check if collection exists
                coll = get_collection(client, TEST_USER_ID, TEST_COLLECTION_ID)
                @test coll.id == TEST_COLLECTION_ID



            end
            @testset "Insert Points" begin
                    # Insert valid points
                    points = [
                        Dict(
                            "_id" => string(uuid4()),
                            "vector" => [1.0, 2.0],
                            "metadata" => "first point"
                        ),
                        Dict(
                            "_id" => string(uuid4()),
                            "vector" => [3.0, 4.0],
                            "metadata" => "second point"
                        ),
                        # Point without ID (should be auto-generated)
                        Dict(
                            "vector" => [5.0, 6.0],
                            "metadata" => "third point"
                        )
                    ]
                    
                    insert_req = InsertPointsRequest(points = points)
                    insert_res = insert_point(client, TEST_USER_ID, TEST_COLLECTION_ID, insert_req)
                    @test insert_res isa InsertPointsResponse
                    @test isempty(insert_res.failedRanges)
            end

            # Insert invalid points
            @testset "Invalid Points" begin


                # Wrong vector dimension
                invalid_points = [Dict("vector" => [1.0, 2.0, 3.0],  # Should be 2D
                    "metadata" => "wrong dimension"
                )]
                invalid_req = InsertPointsRequest(points = invalid_points)

                try
                    insert_point(client, TEST_USER_ID, TEST_COLLECTION_ID, invalid_req)
                    @test false
                catch e
                    @test occursin("400", lowercase(string(e)))
                end
            end


        @testset "Search Operations" begin

            # Vector search


            search_opts = SearchVectorVamanaOptions(
            vector=[1, 2],
            operator="near",
            searchSize=75,
            limit=10
             )
            query = Query(property="vector",vectorVamana=search_opts)
            search_req = SearchRequest(
            query=query,
            select=["*"],
            sort=[SortOption(property="nested",descending=true)],
            limit=10
            )

            search_res = search_point(client, TEST_USER_ID, TEST_COLLECTION_ID,search_req)
                @test search_res isa SearchPointsResponse
                @test length(search_res.points) == 3

            end
        end
        #cleanup
        delete_collection(client,TEST_USER_ID, TEST_COLLECTION_ID)



  

    else
        @info "Skipping tests that require a running SemaDB instance"
    end

    @testset "Model Validation" begin

        # Test model validation for SearchVectorVamanaOptions
        @testset "SearchVectorVamanaOptions Validation" begin
            # Valid options
            options = SearchVectorVamanaOptions(
                vector = [1.0, 2.0],
                limit = 10
            )
            @test OpenAPI.validate_properties(options) === nothing
        end
    end
end
# TODO test search_point,delete_points