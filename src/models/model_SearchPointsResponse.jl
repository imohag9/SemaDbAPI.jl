

"""SearchPointsResponse

    SearchPointsResponse(;
        points=nothing,
    )

    - points::Vector{PointAsObject}
"""
Base.@kwdef mutable struct SearchPointsResponse <: OpenAPI.APIModel
    points::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{PointAsObject} }

    function SearchPointsResponse(points, )
        o = new(points, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchPointsResponse

const _property_types_SearchPointsResponse = Dict{Symbol,String}(Symbol("points")=>"Vector{PointAsObject}", )
OpenAPI.property_type(::Type{ SearchPointsResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchPointsResponse[name]))}

function OpenAPI.check_required(o::SearchPointsResponse)
    true
end

function OpenAPI.validate_properties(o::SearchPointsResponse)
    OpenAPI.validate_property(SearchPointsResponse, Symbol("points"), o.points)
end

function OpenAPI.validate_property(::Type{ SearchPointsResponse }, name::Symbol, val)

end
