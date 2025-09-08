
```@meta
CurrentModule = SemaDbAPI
```

# SemaDbAPI.jl

**SemaDbAPI.jl** is a Julia client library for interacting with [SemaDB](https://github.com/SemaFind/SemaDB), a high-performance vector database designed for similarity search and semantic operations.


## Overview

SemaDbAPI.jl provides a complete, strongly-typed interface to manage collections, insert points, and perform various search operations with different indexing strategies. The package was generated using [OpenAPI.jl](https://github.com/OpenAPITools/OpenAPI.jl), ensuring type safety and comprehensive API coverage.

## Key Features

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

## Installation

```julia-repl
julia> using Pkg
julia> Pkg.add("SemaDbAPI")
```

## Quick Start

```julia
using SemaDbAPI
using UUIDs

# Initialize client
client = SemaDBClient("http://localhost:8081/v2")

# Create a collection with Vamana indexing
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
req = CreateCollectionRequest(id = "mycollection", indexSchema = ischema)
create_collection(client, "Julia", req)

# Insert points
points = [
    Dict("_id" => string(uuid4()), "vector" => [1.0, 2.0], "metadata" => "first point"),
    Dict("_id" => string(uuid4()), "vector" => [3.0, 4.0], "metadata" => "second point")
]
insert_req = InsertPointsRequest(points = points)
insert_point(client, "Julia", "mycollection", insert_req)

# Perform search
search_opts = SearchVectorVamanaOptions(vector = [1, 2], operator = "near")
query = Query(property = "vector", vectorVamana = search_opts)
search_req = SearchRequest(query = query, limit = 10)
search_res = search_point(client, "Julia", "mycollection", search_req)

# Clean up
delete_collection(client, "Julia", "mycollection")
```

## Documentation Structure

```@contents
Pages = [
    "getting_started.md",
    "collections.md",
    "points.md",
    "search.md",
    "models.md",
    "api_reference.md",
]
Depth = 2
```

## License

This package is licensed under the [MIT License](https://opensource.org/licenses/MIT).