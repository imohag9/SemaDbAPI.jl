

""" DeletePointsRequest

    DeletePointsRequest(;
        ids=nothing,
    )

    - ids::Vector{String}
"""
Base.@kwdef mutable struct DeletePointsRequest <: OpenAPI.APIModel
    ids::Union{Nothing, Vector{String}} = nothing

    function DeletePointsRequest(ids, )
        o = new(ids, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type DeletePointsRequest

const _property_types_DeletePointsRequest = Dict{Symbol,String}(Symbol("ids")=>"Vector{String}", )
OpenAPI.property_type(::Type{ DeletePointsRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_DeletePointsRequest[name]))}

function OpenAPI.check_required(o::DeletePointsRequest)
    o.ids === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::DeletePointsRequest)
    OpenAPI.validate_property(DeletePointsRequest, Symbol("ids"), o.ids)
end

function OpenAPI.validate_property(::Type{ DeletePointsRequest }, name::Symbol, val)

    if name === Symbol("ids")
        OpenAPI.validate_param(name, "DeletePointsRequest", :maxItems, val, 100)
    end
end
