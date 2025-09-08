```markdown
```@meta
CurrentModule = SemaDbAPI
```

# Points API

Points represent individual data items stored in a collection. Each point contains fields that match the collection's schema.

## Inserting Points

### Example: Inserting Multiple Points

```julia
using UUIDs

points = [
    Dict(
        "_id" => string(uuid4()),
        "vector" => [0.1, 0.2, 0.3],
        "metadata" => Dict("category" => "A", "value" => 10)
    ),
    Dict(
        "_id" => string(uuid4()),
        "vector" => [0.4, 0.5, 0.6],
        "metadata" => Dict("category" => "B", "value" => 20)
    )
]

insert_req = InsertPointsRequest(points = points)
insert_point(client, "user1", "vectors", insert_req)
```

### Example: Inserting Points with Text Data

```julia
points = [
    Dict(
        "_id" => string(uuid4()),
        "text" => "Julia is a high-level, high-performance programming language"
    ),
    Dict(
        "_id" => string(uuid4()),
        "text" => "Vector databases enable efficient similarity search"
    )
]

insert_req = InsertPointsRequest(points = points)
insert_point(client, "user1", "text_data", insert_req)
```

## Updating Points



### Example: Updating Points

```julia
# Update metadata for a specific point
update_req = UpdatePointsRequest(
    points = [
        Dict(
            "_id" => "f269a46b-ccf7-5d73-abea-4c690281aa53",
            "metadata" => Dict("category" => "Updated", "value" => 100)
        )
    ]
)
update_point(client, "user1", "vectors", update_req)
```


### Example: Deleting Points by ID

```julia
delete_req = DeletePointsRequest(ids = ["f269a46b-ccf7-5d73-abea-4c690281aa53", "point-456"])
delete_point(client, "user1", "vectors", delete_req)
```

### Example: Deleting Points with Filter

```julia
# Create a query to match points with category "B"
query = Query(
    property = "metadata.category",
    string = SearchStringOptions(operator = "equals", value = "B")
)

delete_req = DeletePointsRequest(query = query)
delete_point(client, "user1", "vectors", delete_req)
```

## Point Structure

Points in SemaDB follow a specific structure:

- `_id` (optional): Unique identifier for the point (if not provided, one will be generated)
- Other fields: Must match the collection's schema

### Example Point

```json
{
  "_id": "f269a46b-ccf7-5d73-abea-4c690281aa53",
  "vector": [0.1, 0.2, 0.3],
  "metadata": {
    "category": "A",
    "value": 10
  }
}
```

## Error Handling

When working with points, you may encounter errors such as:

- Invalid point format
- Schema validation errors
- Point not found
- Permission denied

The API returns detailed error information to help diagnose issues:

```julia
try
    insert_point(client, "user1", "vectors", InsertPointsRequest(points = [Dict()]))
catch e
    println("Error inserting points: $(e)")
end
```

The `InsertPointsResponse` also includes information about failed points:

```julia
insert_req = InsertPointsRequest(points = [
    Dict("_id" => "f269a46b-ccf7-5d73-abea-4c690281aa53", "vector" => [1.0, 2.0]),
    Dict("_id" => "invalid", "vector" => "not a vector")
])
response = insert_point(client, "user1", "vectors", insert_req)

if !isempty(response.failedPoints)
    println("Some points failed to insert:")
    for failed in response.failedPoints
        println("- $(failed.id): $(failed.error)")
    end
end
```

## Best Practices

- Always provide `_id` values for points you want to update or delete later
- Batch insert operations for better performance (up to 1000 points per request)
- Use appropriate indexing strategies based on your query patterns
- Consider the vector dimension size when designing your schema
