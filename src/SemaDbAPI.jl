
module SemaDbAPI

using Dates, TimeZones
using OpenAPI
using OpenAPI.Clients

include("modelincludes.jl")
include("client.jl")
include("apis/api.jl")
include("exports.jl")

client = SemaDBClient("http://localhost:8081/v2")
@show client

ivvp = IndexVectorVamanaParameters(
    vectorSize = 2,
    distanceMetric = "euclidean",
    searchSize = 75,
    degreeBound = 64,
    alpha = 1.2
)

# Create index schema
ischema = Dict("vector" => IndexSchemaValue(
    type = "vectorVamana",
    vectorVamana = ivvp
))

# Create collection request
req = CreateCollectionRequest(
    id = "mycollection",
    indexSchema = ischema
)

# Create the collection
res = create_collection(client, "Julia", req)

using UUIDs
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
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 48.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 47.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 45.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 7.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 4.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 5.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 8.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [3.0, 1.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [14.0, 4.0],
        "metadata" => "second point"
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [22.0, 4.0],
        "metadata" => "second point"
    )
]

# Insert points
insert_req = InsertPointsRequest(points = points)
insert_res = insert_point(client, "Julia", "mycollection", insert_req)


search_opts = SearchVectorVamanaOptions(
    vector = [1, 2],
    operator = "near",
    searchSize = 75,
    limit = 10
)
query = Query(property = "vector", vectorVamana = search_opts)
search_req = SearchRequest(
    query = query,
    select = ["*"],
    sort = [SortOption(property = "nested", descending = true)],
    limit = 2
)

search_res = search_point(client, "Julia", "mycollection", search_req)
@show search_res
# Process results
for point in search_res.points
    println("Point ID: $(point._id), Distance: ")
end
delete_collection(client, "Julia", "mycollection")
end
