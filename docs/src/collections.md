```@meta
CurrentModule = SemaDbAPI
```

# Collections API

Collections are the primary organizational unit in SemaDB, similar to tables in relational databases. Each collection contains points with a consistent schema.

## Creating Collections

```@docs
CreateCollectionRequest
IndexSchemaValue
IndexVectorVamanaParameters
IndexVectorFlatParameters
IndexTextParameters
IndexStringParameters
create_collection
```

### Example: Creating a Collection with Vamana Index

```julia
ivvp = IndexVectorVamanaParameters(
    vectorSize = 128,
    distanceMetric = "cosine",
    searchSize = 75,
    degreeBound = 64,
    alpha = 1.2
)

ischema = Dict("embedding" => IndexSchemaValue(
    type = "vectorVamana",
    vectorVamana = ivvp
))

req = CreateCollectionRequest(id = "vectors", indexSchema = ischema)
create_collection(client, "user1", req)
```

### Example: Creating a Collection with Text Index

```julia
text_params = IndexTextParameters(analyser = "standard")
ischema = Dict("description" => IndexSchemaValue(
    type = "text",
    text = text_params
))

req = CreateCollectionRequest(id = "text_data", indexSchema = ischema)
create_collection(client, "user1", req)
```

## Managing Collections

```@docs
get_collection
list_collections
delete_collection
```

### Example: Listing Collections

```julia
collections = list_collections(client, "user1")
for col in collections.collections
    println("Collection: $(col.id)")
end
```

### Example: Getting Collection Details

```julia
collection = get_collection(client, "user1", "vectors")
println("Collection ID: $(collection.id)")
println("Shard count: $(length(collection.shards))")
```

## Collection Schema

Each collection has a schema that defines how data is indexed. The schema is a dictionary mapping field names to index types.

### Supported Index Types

- `vectorVamana`: Graph-based approximate nearest neighbor search
- `vectorFlat`: Exact search (brute force)
- `text`: Text search with semantic capabilities
- `string`: String field indexing
- `stringArray`: Array of strings indexing
- `integer`: Integer field indexing
- `float`: Floating-point field indexing

### Example Schema

```julia
schema = Dict(
    "embedding" => IndexSchemaValue(
        type = "vectorVamana",
        vectorVamana = IndexVectorVamanaParameters(
            vectorSize = 128,
            distanceMetric = "cosine"
        )
    ),
    "description" => IndexSchemaValue(
        type = "text",
        text = IndexTextParameters(analyser = "standard")
    ),
    "category" => IndexSchemaValue(
        type = "string",
        string = IndexStringParameters(caseSensitive = false)
    )
)
```

## Error Handling

When working with collections, you may encounter errors. The API returns appropriate error responses that you can handle:

```julia
try
    create_collection(client, "user1", CreateCollectionRequest(id = "invalid name", indexSchema = Dict()))
catch e
    println("Error creating collection: $(e)")
end
```

Common errors include:
- Invalid collection name format
- Schema validation errors
- Collection already exists
- Permission denied
