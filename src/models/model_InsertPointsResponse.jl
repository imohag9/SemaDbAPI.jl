

"""InsertPointsResponse

    InsertPointsResponse(;
        message=nothing,
        failedRanges=nothing,
    )

    - message::String : A message indicating the result of the operation
    - failedRanges::Vector{InsertPointsResponseFailedRangesInner} : A list of ranges of points that failed to insert. Each range has a start and an end index.  The end index is exclusive. For example, if the range is [0, 2], the first two points failed to insert.
"""
Base.@kwdef mutable struct InsertPointsResponse <: OpenAPI.APIModel
    message::Union{Nothing, String} = nothing
    failedRanges::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{InsertPointsResponseFailedRangesInner} }

    function InsertPointsResponse(message, failedRanges, )
        o = new(message, failedRanges, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InsertPointsResponse

const _property_types_InsertPointsResponse = Dict{Symbol,String}(Symbol("message")=>"String", Symbol("failedRanges")=>"Vector{InsertPointsResponseFailedRangesInner}", )
OpenAPI.property_type(::Type{ InsertPointsResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InsertPointsResponse[name]))}

function OpenAPI.check_required(o::InsertPointsResponse)
    true
end

function OpenAPI.validate_properties(o::InsertPointsResponse)
    OpenAPI.validate_property(InsertPointsResponse, Symbol("message"), o.message)
    OpenAPI.validate_property(InsertPointsResponse, Symbol("failedRanges"), o.failedRanges)
end

function OpenAPI.validate_property(::Type{ InsertPointsResponse }, name::Symbol, val)


end
