

"""SearchStringArrayOptions
Options for searching string arrays. The operator determines how the search is performed. The value is an array of strings to search for.

    SearchStringArrayOptions(;
        value=nothing,
        operator=nothing,
    )

    - value::Vector{String}
    - operator::String
"""
Base.@kwdef mutable struct SearchStringArrayOptions <: OpenAPI.APIModel
    value::Union{Nothing, Vector{String}} = nothing
    operator::Union{Nothing, String} = nothing

    function SearchStringArrayOptions(value, operator, )
        o = new(value, operator, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchStringArrayOptions

const _property_types_SearchStringArrayOptions = Dict{Symbol,String}(Symbol("value")=>"Vector{String}", Symbol("operator")=>"String", )
OpenAPI.property_type(::Type{ SearchStringArrayOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchStringArrayOptions[name]))}

function OpenAPI.check_required(o::SearchStringArrayOptions)
    o.value === nothing && (return false)
    o.operator === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchStringArrayOptions)
    OpenAPI.validate_property(SearchStringArrayOptions, Symbol("value"), o.value)
    OpenAPI.validate_property(SearchStringArrayOptions, Symbol("operator"), o.operator)
end

function OpenAPI.validate_property(::Type{ SearchStringArrayOptions }, name::Symbol, val)


    if name === Symbol("operator")
        OpenAPI.validate_param(name, "SearchStringArrayOptions", :enum, val, ["containsAll", "containsAny"])
    end

end
