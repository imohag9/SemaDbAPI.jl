

""" CreateCollectionRequest

    CreateCollectionRequest(;
        id=nothing,
        indexSchema=nothing,
    )

    - id::String : The unique identifier of the collection
    - indexSchema::Dict{String, IndexSchemaValue} : The schema for the collection, each property can be indexed with a different type of index.
"""
Base.@kwdef mutable struct CreateCollectionRequest <: OpenAPI.APIModel
    id::Union{Nothing, String} = nothing
    indexSchema::Union{Nothing, Dict} = nothing # spec type: Union{ Nothing, Dict{String, IndexSchemaValue} }

    function CreateCollectionRequest(id, indexSchema, )
        o = new(id, indexSchema, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type CreateCollectionRequest

const _property_types_CreateCollectionRequest = Dict{Symbol,String}(Symbol("id")=>"String", Symbol("indexSchema")=>"Dict{String, IndexSchemaValue}", )
OpenAPI.property_type(::Type{ CreateCollectionRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_CreateCollectionRequest[name]))}

function OpenAPI.check_required(o::CreateCollectionRequest)
    true
end

function OpenAPI.validate_properties(o::CreateCollectionRequest)
    OpenAPI.validate_property(CreateCollectionRequest, Symbol("id"), o.id)
    OpenAPI.validate_property(CreateCollectionRequest, Symbol("indexSchema"), o.indexSchema)
end

function OpenAPI.validate_property(::Type{ CreateCollectionRequest }, name::Symbol, val)

    if name === Symbol("id")
        OpenAPI.validate_param(name, "CreateCollectionRequest", :pattern, val, r"^[a-z0-9]{3,24}$")
    end

    if name === Symbol("indexSchema")
        OpenAPI.validate_param(name, "CreateCollectionRequest", :minItems, val, 1)
        OpenAPI.validate_param(name, "CreateCollectionRequest", :minProperties, val, 1)
    end
end
