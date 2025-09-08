# SemaDbAPI  [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://imohag9.github.io/SemaDbAPI.jl/dev/) [![Build Status](https://github.com/imohag9/SemaDbAPI.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/imohag9/SemaDbAPI.jl/actions/workflows/CI.yml?query=branch%3Amain)

SemaDbAPI.jl is a Julia client package for interacting with **SemaDB**, a high-performance vector database system designed for efficient similarity search and document storage. This package provides a comprehensive interface to leverage SemaDB's advanced capabilities for vector search, text indexing, and metadata management.

> **Note**: This package was generated using [OpenAPI.jl](https://github.com/OpenAPITools/OpenAPI.jl), providing a strongly-typed Julia interface to the SemaDB API.


## Features

- **Multiple Indexing Strategies**:
  - Vamana (graph-based approximate nearest neighbor search)
  - Flat (exact search)
  - Text indexing for semantic search
  - Binary and Product quantization options

- **Rich Query Capabilities**:
  - Vector similarity search
  - Metadata filtering
  - Complex query composition with AND/OR operators
  - Sorting and pagination

- **Strongly-Typed Interface**:
  - Generated models for all API requests and responses
  - Compile-time validation of parameters
  - Comprehensive error handling

- **Collection Management**:
  - Create, list, and delete collections
  - View collection schema and statistics
  - Update collection settings

## Installation

To install SemaDbAPI.jl, use the Julia package manager:

```julia
using Pkg
Pkg.add("SemaDbAPI")
```

## Quick Start

### 1. Start SemaDB

[SemaDB docs](https://semadb.com/docs/deployment/)

### 2. Basic Usage

```julia
using SemaDbAPI
using UUIDs

# Initialize client
client = SemaDBClient("http://localhost:8081/v2")

# Create Vamana index parameters
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

# Create collection
req = CreateCollectionRequest(id = "mycollection", indexSchema = ischema)
create_collection(client, "user1", req)

# Insert points
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
    )
]
insert_req = InsertPointsRequest(points = points)
insert_point(client, "user1", "mycollection", insert_req)

# Perform search
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
    sort = [SortOption(property = "metadata", descending = false)],
    limit = 2
)
search_res = search_point(client, "user1", "mycollection", search_req)

# Display results
for point in search_res.points
    println("Point ID: $(point._id)")
end

# Clean up
delete_collection(client, "user1", "mycollection")
```

## Advanced Usage

### Complex Query Composition

SemaDbAPI.jl supports building complex queries that combine vector search with metadata filtering:

```julia
# Create a query that finds points with vector near [1,2] AND metadata equals "first point"
vector_query = Query(
    property = "vector",
    vectorVamana = SearchVectorVamanaOptions(vector = [1, 2], operator = "near")
)
metadata_query = Query(
    property = "metadata",
    string = SearchStringOptions(operator = "equals", value = "first point")
)
combined_query = Query(_and = [vector_query, metadata_query])

search_req = SearchRequest(query = combined_query, limit = 10)
search_res = search_point(client, "user1", "mycollection", search_req)
```

### Text Search

For text-based semantic search:

```julia
# First create a text index
text_params = IndexTextParameters(analyser = "standard")
text_schema = Dict("description" => IndexSchemaValue(
    type = "text",
    text = text_params
))
create_collection(client, "user1", CreateCollectionRequest(
    id = "text_collection",
    indexSchema = text_schema
))

# Insert text documents
insert_req = InsertPointsRequest(points = [
    Dict("_id" => string(uuid4()), "description" => "Julia is a high-level, high-performance programming language"),
    Dict("_id" => string(uuid4()), "description" => "Vector databases are used for similarity search")
])
insert_point(client, "user1", "text_collection", insert_req)

# Search for relevant documents
text_search = SearchTextOptions(query = "programming language")
query = Query(property = "description", text = text_search)
search_res = search_point(client, "user1", "text_collection", SearchRequest(query = query))
```

## Testing

The package includes a comprehensive test suite that can be run with:

```julia
using Pkg
Pkg.test("SemaDbAPI")
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

