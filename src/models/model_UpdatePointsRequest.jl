

"""UpdatePointsRequest

    UpdatePointsRequest(;
        points=nothing,
    )

    - points::Vector{PointAsObject}
"""
Base.@kwdef mutable struct UpdatePointsRequest <: OpenAPI.APIModel
    points::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{PointAsObject} }

    function UpdatePointsRequest(points, )
        o = new(points, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type UpdatePointsRequest

const _property_types_UpdatePointsRequest = Dict{Symbol,String}(Symbol("points")=>"Vector{PointAsObject}", )
OpenAPI.property_type(::Type{ UpdatePointsRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_UpdatePointsRequest[name]))}

function OpenAPI.check_required(o::UpdatePointsRequest)
    o.points === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::UpdatePointsRequest)
    OpenAPI.validate_property(UpdatePointsRequest, Symbol("points"), o.points)
end

function OpenAPI.validate_property(::Type{ UpdatePointsRequest }, name::Symbol, val)

    if name === Symbol("points")
        OpenAPI.validate_param(name, "UpdatePointsRequest", :maxItems, val, 100)
    end
end
