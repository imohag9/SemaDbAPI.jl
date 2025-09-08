

"""UpdatePointsResponse

    UpdatePointsResponse(;
        message=nothing,
        failedPoints=nothing,
    )

    - message::String : A message indicating the result of the operation
    - failedPoints::Vector{FailedPointsInner} : A list of points that failed to insert. Each point has an id and an error message. For example, if the error is not found, the point does not exist in the collection.
"""
Base.@kwdef mutable struct UpdatePointsResponse <: OpenAPI.APIModel
    message::Union{Nothing, String} = nothing
    failedPoints::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{FailedPointsInner} }

    function UpdatePointsResponse(message, failedPoints, )
        o = new(message, failedPoints, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type UpdatePointsResponse

const _property_types_UpdatePointsResponse = Dict{Symbol,String}(Symbol("message")=>"String", Symbol("failedPoints")=>"Vector{FailedPointsInner}", )
OpenAPI.property_type(::Type{ UpdatePointsResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_UpdatePointsResponse[name]))}

function OpenAPI.check_required(o::UpdatePointsResponse)
    true
end

function OpenAPI.validate_properties(o::UpdatePointsResponse)
    OpenAPI.validate_property(UpdatePointsResponse, Symbol("message"), o.message)
    OpenAPI.validate_property(UpdatePointsResponse, Symbol("failedPoints"), o.failedPoints)
end

function OpenAPI.validate_property(::Type{ UpdatePointsResponse }, name::Symbol, val)


end
