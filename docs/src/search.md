
```@meta
CurrentModule = SemaDbAPI
```

# Search API

The search functionality in SemaDB allows you to find points based on various criteria, including vector similarity, text matching, and metadata filtering.

## Basic Search



### Example: Simple Vector Search

```julia
# Search for points similar to [0.1, 0.2, 0.3]
search_opts = SearchVectorVamanaOptions(
    vector = [0.1, 0.2, 0.3],
    operator = "near",
    searchSize = 75,
    limit = 5
)

query = Query(property = "vector", vectorVamana = search_opts)
search_req = SearchRequest(query = query)
results = search_point(client, "user1", "vectors", search_req)

for point in results.points
    println("ID: $(point._id)")
end
```


## Query Composition

SemaDB supports complex queries that combine multiple conditions.

### Example: AND Combination

```julia
# Find points with vector near [0.1, 0.2, 0.3] AND metadata.category equals "A"
vector_query = Query(
    property = "vector",
    vectorVamana = SearchVectorVamanaOptions(
        vector = [0.1, 0.2, 0.3],
        operator = "near"
    )
)
category_query = Query(
    property = "metadata.category",
    string = SearchStringOptions(operator = "equals", value = "A")
)
combined_query = Query(_and = [vector_query, category_query])

search_req = SearchRequest(query = combined_query, limit = 10)
results = search_point(client, "user1", "vectors", search_req)
```

### Example: OR Combination

```julia
# Find points with metadata.category equals "A" OR "B"
query_a = Query(
    property = "metadata.category",
    string = SearchStringOptions(operator = "equals", value = "A")
)
query_b = Query(
    property = "metadata.category",
    string = SearchStringOptions(operator = "equals", value = "B")
)
combined_query = Query(_or = [query_a, query_b])

search_req = SearchRequest(query = combined_query, limit = 10)
results = search_point(client, "user1", "vectors", search_req)
```



### Example: Sorting by Metadata

```julia
# Search and sort by metadata.value in descending order
search_opts = SearchVectorVamanaOptions(
    vector = [0.1, 0.2, 0.3],
    operator = "near"
)
query = Query(property = "vector", vectorVamana = search_opts)
search_req = SearchRequest(
    query = query,
    sort = [SortOption(property = "metadata.value", descending = true)],
    limit = 10
)
results = search_point(client, "user1", "vectors", search_req)
```

## Selecting Fields

```julia
# Only return specific fields
search_req = SearchRequest(
    query = query,
    select = ["_id", "metadata.category"],
    limit = 10
)
results = search_point(client, "user1", "vectors", search_req)
```

## Advanced Search Techniques

### Hybrid Search

Combine vector search with text search for more relevant results:

```julia
# Vector part of the search
vector_query = Query(
    property = "vector",
    vectorVamana = SearchVectorVamanaOptions(
        vector = [0.1, 0.2, 0.3],
        weight = 0.7
    )
)

# Text part of the search
text_query = Query(
    property = "description",
    text = SearchTextOptions(
        query = "programming language",
        weight = 0.3
    )
)

# Combine both queries
combined_query = Query(_and = [vector_query, text_query])

search_req = SearchRequest(query = combined_query, limit = 10)
results = search_point(client, "user1", "hybrid_collection", search_req)
```

### Range Queries

```julia
# Find points with metadata.value between 10 and 20
range_query = Query(
    property = "metadata.value",
    integer = SearchNumberOptions(
        operator = "inRange",
        value = 10,
        endValue = 20
    )
)

search_req = SearchRequest(query = range_query, limit = 10)
results = search_point(client, "user1", "vectors", search_req)
```

### Fuzzy Text Search

```julia
text_query = Query(
    property = "description",
    text = SearchTextOptions(
        query = "programing languge",
        operator = "containsAll"
    )
)

search_req = SearchRequest(query = text_query, limit = 5)
results = search_point(client, "user1", "text_data", search_req)
```

## Performance Considerations

- Use appropriate `searchSize` for Vamana indexing (higher values increase accuracy but decrease speed)
- Limit the number of results with the `limit` parameter
- Only select necessary fields with the `select` parameter
- For exact search requirements, consider using Flat indexing
- For large datasets, ensure proper indexing of frequently queried fields
