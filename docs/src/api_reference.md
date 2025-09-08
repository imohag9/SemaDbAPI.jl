```markdown
```@meta
CurrentModule = SemaDbAPI
```

# Data Models

This section documents the key data models used throughout the SemaDbAPI.jl package.

## Index Parameters

### Vector Indexing

```@docs
IndexVectorVamanaParameters
IndexVectorFlatParameters
```

#### Vamana Parameters

The Vamana index uses graph-based approximate nearest neighbor search. Key parameters:

- `vectorSize`: Dimension of the vectors (required)
- `distanceMetric`: Distance metric to use ("euclidean", "cosine", "dotproduct")
- `searchSize`: Controls the size of the search (higher = more accurate but slower)
- `degreeBound`: Maximum degree of the graph nodes
- `alpha`: Graph construction parameter
- `quantizer`: Optional quantization strategy

#### Flat Parameters

The Flat index performs exact search (brute force):

- `vectorSize`: Dimension of the vectors (required)
- `distanceMetric`: Distance metric to use
- `quantizer`: Optional quantization strategy

### Text Indexing

```@docs
IndexTextParameters
```

- `analyser`: Text analysis strategy ("standard", "english", etc.)

### String Indexing

```@docs
IndexStringParameters
```

- `caseSensitive`: Whether string comparisons should be case-sensitive

### Quantization

```@docs
Quantizer
BinaryQuantizerParameters
ProductQuantizerParameters
```

## Search Options

### Vector Search

```@docs
SearchVectorVamanaOptions
SearchVectorFlatOptions
```

### Text Search

```@docs
SearchTextOptions
```

### String Search

```@docs
SearchStringOptions
SearchStringArrayOptions
```

### Numeric Search

```@docs
SearchNumberOptions
```

## Query Structure

```@docs
Query
```

The `Query` struct is the core of SemaDB's query system, allowing for complex combinations of conditions:

- `property`: The field to query against
- Vector/text/string/numeric options: Specific search parameters
- `_and`: Combine multiple queries with AND logic
- `_or`: Combine multiple queries with OR logic

## Response Models

```@docs
GetCollectionResponse
InsertPointsResponse
SearchPointsResponse
DeletePointsResponse
UpdatePointsResponse
```

### Collection Response

Contains information about a collection:

- `id`: Collection identifier
- `indexSchema`: Schema definition
- `shards`: Distribution information

### Insert Response

- `successCount`: Number of successfully inserted points
- `failedPoints`: Details about failed insertions

### Search Response

- `points`: Matching points with distances
- `count`: Total number of matching points (may exceed returned limit)

### Delete Response

- `message`: Operation result message
- `failedPoints`: Points that couldn't be deleted

### Update Response

- `successCount`: Number of successfully updated points
- `failedPoints`: Details about failed updates

## Error Handling

All API operations can potentially return errors. The package uses Julia's exception system to handle errors:

```julia
try
    # API call that might fail
    create_collection(client, "user1", CreateCollectionRequest(id = "invalid name!"))
catch e
    # Handle the error
    println("API error: $e")
end
```

Common error types include:
- `OpenAPI.APIError`: Base API error
- `OpenAPI.ValidationError`: Schema validation error
- `HTTP.ExceptionRequest.StatusError`: HTTP status errors
```