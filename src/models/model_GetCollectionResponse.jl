

"""GetCollectionResponse

    GetCollectionResponse(;
        id=nothing,
        indexSchema=nothing,
        shards=nothing,
    )

    - id::String : The unique identifier of the collection
    - indexSchema::Dict{String, IndexSchemaValue} : The schema for the collection, each property can be indexed with a different type of index.
    - shards::Vector{GetCollectionResponseShardsInner}
"""
Base.@kwdef mutable struct GetCollectionResponse <: OpenAPI.APIModel
    id::Union{Nothing, String} = nothing
    indexSchema::Union{Nothing, Dict} = nothing # spec type: Union{ Nothing, Dict{String, IndexSchemaValue} }
    shards::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{GetCollectionResponseShardsInner} }

    function GetCollectionResponse(id, indexSchema, shards, )
        o = new(id, indexSchema, shards, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type GetCollectionResponse

const _property_types_GetCollectionResponse = Dict{Symbol,String}(Symbol("id")=>"String", Symbol("indexSchema")=>"Dict{String, IndexSchemaValue}", Symbol("shards")=>"Vector{GetCollectionResponseShardsInner}", )
OpenAPI.property_type(::Type{ GetCollectionResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_GetCollectionResponse[name]))}

function OpenAPI.check_required(o::GetCollectionResponse)
    true
end

function OpenAPI.validate_properties(o::GetCollectionResponse)
    OpenAPI.validate_property(GetCollectionResponse, Symbol("id"), o.id)
    OpenAPI.validate_property(GetCollectionResponse, Symbol("indexSchema"), o.indexSchema)
    OpenAPI.validate_property(GetCollectionResponse, Symbol("shards"), o.shards)
end

function OpenAPI.validate_property(::Type{ GetCollectionResponse }, name::Symbol, val)

    if name === Symbol("id")
        OpenAPI.validate_param(name, "GetCollectionResponse", :pattern, val, r"^[a-z0-9]{3,24}$")
    end

    if name === Symbol("indexSchema")
        OpenAPI.validate_param(name, "GetCollectionResponse", :minItems, val, 1)
        OpenAPI.validate_param(name, "GetCollectionResponse", :minProperties, val, 1)
    end

end
