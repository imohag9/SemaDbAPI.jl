

""" DeletePointsResponse

    DeletePointsResponse(;
        message=nothing,
        failedPoints=nothing,
    )

    - message::String : A message indicating the result of the operation
    - failedPoints::Vector{FailedPointsInner} : A list of points that failed to insert. Each point has an id and an error message. For example, if the error isnot found, the point does not exist in the collection.
"""

Base.@kwdef mutable struct DeletePointsResponse <: OpenAPI.APIModel
    message::Union{Nothing, String} = nothing
    failedPoints::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{FailedPointsInner} }

    function DeletePointsResponse(message, failedPoints, )
        o = new(message, failedPoints, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type DeletePointsResponse

const _property_types_DeletePointsResponse = Dict{Symbol,String}(Symbol("message")=>"String", Symbol("failedPoints")=>"Vector{FailedPointsInner}", )
OpenAPI.property_type(::Type{ DeletePointsResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_DeletePointsResponse[name]))}

function OpenAPI.check_required(o::DeletePointsResponse)
    true
end

function OpenAPI.validate_properties(o::DeletePointsResponse)
    OpenAPI.validate_property(DeletePointsResponse, Symbol("message"), o.message)
    OpenAPI.validate_property(DeletePointsResponse, Symbol("failedPoints"), o.failedPoints)
end

function OpenAPI.validate_property(::Type{ DeletePointsResponse }, name::Symbol, val)


end
