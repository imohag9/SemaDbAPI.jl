

"""InsertPointsRequest

    InsertPointsRequest(;
        points=nothing,
    )

"""
Base.@kwdef mutable struct InsertPointsRequest <: OpenAPI.APIModel
    points::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{PointAsObject} }

    function InsertPointsRequest(points, )
        o = new(points, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InsertPointsRequest

const _property_types_InsertPointsRequest = Dict{Symbol,String}(Symbol("points")=>"Vector{Dict{String, Any}}", )
OpenAPI.property_type(::Type{ InsertPointsRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InsertPointsRequest[name]))}

function OpenAPI.check_required(o::InsertPointsRequest)
    o.points === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::InsertPointsRequest)
    OpenAPI.validate_property(InsertPointsRequest, Symbol("points"), o.points)
end

function OpenAPI.validate_property(::Type{ InsertPointsRequest }, name::Symbol, val)

    if name === Symbol("points")
        OpenAPI.validate_param(name, "InsertPointsRequest", :maxItems, val, 10000)
    end
end
