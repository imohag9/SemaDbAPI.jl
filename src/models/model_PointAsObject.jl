

"""PointAsObject
JSON serialisable point data

    PointAsObject(;
        _id=nothing,
    )

    - _id::String
"""
Base.@kwdef mutable struct PointAsObject <: OpenAPI.APIModel
    _id::Union{Nothing, String} = nothing

    function PointAsObject(_id, )
        o = new(_id, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type PointAsObject

const _property_types_PointAsObject = Dict{Symbol,String}(Symbol("_id")=>"String", )
OpenAPI.property_type(::Type{ PointAsObject }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PointAsObject[name]))}

function OpenAPI.check_required(o::PointAsObject)
    true
end

function OpenAPI.validate_properties(o::PointAsObject)
    OpenAPI.validate_property(PointAsObject, Symbol("_id"), o._id)
end

function OpenAPI.validate_property(::Type{ PointAsObject }, name::Symbol, val)

    if name === Symbol("_id")
        OpenAPI.validate_param(name, "PointAsObject", :format, val, "uuid")
    end
end
