

"""SearchStringOptions
Options for searching strings. The operator determines how the search is performed. The value is a string to search for.

    SearchStringOptions(;
        value=nothing,
        operator=nothing,
        endValue=nothing,
    )

    - value::String
    - operator::String
    - endValue::String
"""
Base.@kwdef mutable struct SearchStringOptions <: OpenAPI.APIModel
    value::Union{Nothing, String} = nothing
    operator::Union{Nothing, String} = nothing
    endValue::Union{Nothing, String} = nothing

    function SearchStringOptions(value, operator, endValue, )
        o = new(value, operator, endValue, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchStringOptions

const _property_types_SearchStringOptions = Dict{Symbol,String}(Symbol("value")=>"String", Symbol("operator")=>"String", Symbol("endValue")=>"String", )
OpenAPI.property_type(::Type{ SearchStringOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchStringOptions[name]))}

function OpenAPI.check_required(o::SearchStringOptions)
    o.value === nothing && (return false)
    o.operator === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchStringOptions)
    OpenAPI.validate_property(SearchStringOptions, Symbol("value"), o.value)
    OpenAPI.validate_property(SearchStringOptions, Symbol("operator"), o.operator)
    OpenAPI.validate_property(SearchStringOptions, Symbol("endValue"), o.endValue)
end

function OpenAPI.validate_property(::Type{ SearchStringOptions }, name::Symbol, val)


    if name === Symbol("operator")
        OpenAPI.validate_param(name, "SearchStringOptions", :enum, val, ["startsWith", "equals", "notEquals", "greaterThan", "greaterThanOrEquals", "lessThan", "lessThanOrEquals", "inRange"])
    end


end
