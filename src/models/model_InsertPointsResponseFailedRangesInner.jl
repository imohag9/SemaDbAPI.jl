

"""InsertPointsResponse_failedRanges_inner

    InsertPointsResponseFailedRangesInner(;
        shardId=nothing,
        start=nothing,
        var"end"=nothing,
        error=nothing,
    )

    - shardId::String
    - start::Int64
    - var"end"::Int64
    - error::String
"""
Base.@kwdef mutable struct InsertPointsResponseFailedRangesInner <: OpenAPI.APIModel
    shardId::Union{Nothing, String} = nothing
    start::Union{Nothing, Int64} = nothing
    var"end"::Union{Nothing, Int64} = nothing
    error::Union{Nothing, String} = nothing

    function InsertPointsResponseFailedRangesInner(shardId, start, var"end", error, )
        o = new(shardId, start, var"end", error, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InsertPointsResponseFailedRangesInner

const _property_types_InsertPointsResponseFailedRangesInner = Dict{Symbol,String}(Symbol("shardId")=>"String", Symbol("start")=>"Int64", Symbol("end")=>"Int64", Symbol("error")=>"String", )
OpenAPI.property_type(::Type{ InsertPointsResponseFailedRangesInner }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InsertPointsResponseFailedRangesInner[name]))}

function OpenAPI.check_required(o::InsertPointsResponseFailedRangesInner)
    true
end

function OpenAPI.validate_properties(o::InsertPointsResponseFailedRangesInner)
    OpenAPI.validate_property(InsertPointsResponseFailedRangesInner, Symbol("shardId"), o.shardId)
    OpenAPI.validate_property(InsertPointsResponseFailedRangesInner, Symbol("start"), o.start)
    OpenAPI.validate_property(InsertPointsResponseFailedRangesInner, Symbol("end"), o.var"end")
    OpenAPI.validate_property(InsertPointsResponseFailedRangesInner, Symbol("error"), o.error)
end

function OpenAPI.validate_property(::Type{ InsertPointsResponseFailedRangesInner }, name::Symbol, val)

    if name === Symbol("shardId")
        OpenAPI.validate_param(name, "InsertPointsResponseFailedRangesInner", :format, val, "uuid")
    end



end
