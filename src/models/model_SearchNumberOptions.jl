

"""SearchNumberOptions
Options for searching numbers. The operator determines how the search is performed. The value is a number to search for, endValue is used for range queries.

    SearchNumberOptions(;
        value=nothing,
        operator=nothing,
        endValue=nothing,
    )

    - value::Float64
    - operator::String
    - endValue::Float64
"""
Base.@kwdef mutable struct SearchNumberOptions <: OpenAPI.APIModel
    value::Union{Nothing, Float64} = nothing
    operator::Union{Nothing, String} = nothing
    endValue::Union{Nothing, Float64} = nothing

    function SearchNumberOptions(value, operator, endValue, )
        o = new(value, operator, endValue, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchNumberOptions

const _property_types_SearchNumberOptions = Dict{Symbol,String}(Symbol("value")=>"Float64", Symbol("operator")=>"String", Symbol("endValue")=>"Float64", )
OpenAPI.property_type(::Type{ SearchNumberOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchNumberOptions[name]))}

function OpenAPI.check_required(o::SearchNumberOptions)
    o.value === nothing && (return false)
    o.operator === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchNumberOptions)
    OpenAPI.validate_property(SearchNumberOptions, Symbol("value"), o.value)
    OpenAPI.validate_property(SearchNumberOptions, Symbol("operator"), o.operator)
    OpenAPI.validate_property(SearchNumberOptions, Symbol("endValue"), o.endValue)
end

function OpenAPI.validate_property(::Type{ SearchNumberOptions }, name::Symbol, val)


    if name === Symbol("operator")
        OpenAPI.validate_param(name, "SearchNumberOptions", :enum, val, ["equals", "notEquals", "greaterThan", "greaterThanOrEquals", "lessThan", "lessThanOrEquals", "inRange"])
    end


end
