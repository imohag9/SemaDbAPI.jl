

"""FailedPoints_inner

    FailedPointsInner(;
        id=nothing,
        error=nothing,
    )

    - id::String
    - error::String
"""
Base.@kwdef mutable struct FailedPointsInner <: OpenAPI.APIModel
    id::Union{Nothing, String} = nothing
    error::Union{Nothing, String} = nothing

    function FailedPointsInner(id, error, )
        o = new(id, error, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type FailedPointsInner

const _property_types_FailedPointsInner = Dict{Symbol,String}(Symbol("id")=>"String", Symbol("error")=>"String", )
OpenAPI.property_type(::Type{ FailedPointsInner }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_FailedPointsInner[name]))}

function OpenAPI.check_required(o::FailedPointsInner)
    true
end

function OpenAPI.validate_properties(o::FailedPointsInner)
    OpenAPI.validate_property(FailedPointsInner, Symbol("id"), o.id)
    OpenAPI.validate_property(FailedPointsInner, Symbol("error"), o.error)
end

function OpenAPI.validate_property(::Type{ FailedPointsInner }, name::Symbol, val)

    if name === Symbol("id")
        OpenAPI.validate_param(name, "FailedPointsInner", :format, val, "uuid")
    end

end
