

"""SearchTextOptions
Text search options, the value is the text to search for. The weight determines the hybrid search weighting.

    SearchTextOptions(;
        value=nothing,
        operator=nothing,
        limit=10,
        filter=nothing,
        weight=1,
    )

    - value::String
    - operator::String
    - limit::Float64 : Maximum number of points to search
    - filter::Query
    - weight::Float64 : The weight of the text search, the higher the value, the more important the text search is.
"""
Base.@kwdef mutable struct SearchTextOptions <: OpenAPI.APIModel
    value::Union{Nothing, String} = nothing
    operator::Union{Nothing, String} = nothing
    limit::Union{Nothing, Float64} = 10
    filter = nothing # spec type: Union{ Nothing, Query }
    weight::Union{Nothing, Float64} = 1

    function SearchTextOptions(value, operator, limit, filter, weight, )
        o = new(value, operator, limit, filter, weight, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchTextOptions

const _property_types_SearchTextOptions = Dict{Symbol,String}(Symbol("value")=>"String", Symbol("operator")=>"String", Symbol("limit")=>"Float64", Symbol("filter")=>"Query", Symbol("weight")=>"Float64", )
OpenAPI.property_type(::Type{ SearchTextOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchTextOptions[name]))}

function OpenAPI.check_required(o::SearchTextOptions)
    o.value === nothing && (return false)
    o.operator === nothing && (return false)
    o.limit === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchTextOptions)
    OpenAPI.validate_property(SearchTextOptions, Symbol("value"), o.value)
    OpenAPI.validate_property(SearchTextOptions, Symbol("operator"), o.operator)
    OpenAPI.validate_property(SearchTextOptions, Symbol("limit"), o.limit)
    OpenAPI.validate_property(SearchTextOptions, Symbol("filter"), o.filter)
    OpenAPI.validate_property(SearchTextOptions, Symbol("weight"), o.weight)
end

function OpenAPI.validate_property(::Type{ SearchTextOptions }, name::Symbol, val)


    if name === Symbol("operator")
        OpenAPI.validate_param(name, "SearchTextOptions", :enum, val, ["containsAll", "containsAny"])
    end


    if name === Symbol("limit")
        OpenAPI.validate_param(name, "SearchTextOptions", :maximum, val, 75, false)
        OpenAPI.validate_param(name, "SearchTextOptions", :minimum, val, 1, false)
    end


end
