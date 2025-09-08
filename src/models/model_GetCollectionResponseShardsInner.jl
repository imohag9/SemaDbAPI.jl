

""" GetCollectionResponse_shards_inner

    GetCollectionResponseShardsInner(;
        id=nothing,
        pointCount=nothing,
    )

    - id::String
    - pointCount::Float64
"""
Base.@kwdef mutable struct GetCollectionResponseShardsInner <: OpenAPI.APIModel
    id::Union{Nothing, String} = nothing
    pointCount::Union{Nothing, Float64} = nothing

    function GetCollectionResponseShardsInner(id, pointCount, )
        o = new(id, pointCount, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type GetCollectionResponseShardsInner

const _property_types_GetCollectionResponseShardsInner = Dict{Symbol,String}(Symbol("id")=>"String", Symbol("pointCount")=>"Float64", )
OpenAPI.property_type(::Type{ GetCollectionResponseShardsInner }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_GetCollectionResponseShardsInner[name]))}

function OpenAPI.check_required(o::GetCollectionResponseShardsInner)
    true
end

function OpenAPI.validate_properties(o::GetCollectionResponseShardsInner)
    OpenAPI.validate_property(GetCollectionResponseShardsInner, Symbol("id"), o.id)
    OpenAPI.validate_property(GetCollectionResponseShardsInner, Symbol("pointCount"), o.pointCount)
end

function OpenAPI.validate_property(::Type{ GetCollectionResponseShardsInner }, name::Symbol, val)

    if name === Symbol("id")
        OpenAPI.validate_param(name, "GetCollectionResponseShardsInner", :format, val, "uuid")
    end

end
