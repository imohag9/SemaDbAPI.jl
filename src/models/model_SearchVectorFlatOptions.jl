

"""SearchVectorFlatOptions
Options for searching vectors with flat indexing.

    SearchVectorFlatOptions(;
        vector=nothing,
        operator=nothing,
        limit=10,
        filter=nothing,
        weight=1,
    )

    - vector::Vector{Float64} : A vector with a fixed number of dimensions
    - operator::String
    - limit::Float64 : Maximum number of points to search
    - filter::Query
    - weight::Float64 : The weight of the vector search, the higher the value, the more important the vector search is.
"""
Base.@kwdef mutable struct SearchVectorFlatOptions <: OpenAPI.APIModel
    vector::Union{Nothing, Vector{Float64}} = nothing
    operator::Union{Nothing, String} = nothing
    limit::Union{Nothing, Float64} = 10
    filter = nothing # spec type: Union{ Nothing, Query }
    weight::Union{Nothing, Float64} = 1

    function SearchVectorFlatOptions(vector, operator, limit, filter, weight, )
        o = new(vector, operator, limit, filter, weight, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchVectorFlatOptions

const _property_types_SearchVectorFlatOptions = Dict{Symbol,String}(Symbol("vector")=>"Vector{Float64}", Symbol("operator")=>"String", Symbol("limit")=>"Float64", Symbol("filter")=>"Query", Symbol("weight")=>"Float64", )
OpenAPI.property_type(::Type{ SearchVectorFlatOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchVectorFlatOptions[name]))}

function OpenAPI.check_required(o::SearchVectorFlatOptions)
    o.vector === nothing && (return false)
    o.operator === nothing && (return false)
    o.limit === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchVectorFlatOptions)
    OpenAPI.validate_property(SearchVectorFlatOptions, Symbol("vector"), o.vector)
    OpenAPI.validate_property(SearchVectorFlatOptions, Symbol("operator"), o.operator)
    OpenAPI.validate_property(SearchVectorFlatOptions, Symbol("limit"), o.limit)
    OpenAPI.validate_property(SearchVectorFlatOptions, Symbol("filter"), o.filter)
    OpenAPI.validate_property(SearchVectorFlatOptions, Symbol("weight"), o.weight)
end

function OpenAPI.validate_property(::Type{ SearchVectorFlatOptions }, name::Symbol, val)

    if name === Symbol("vector")
        OpenAPI.validate_param(name, "SearchVectorFlatOptions", :maxItems, val, 4096)
        OpenAPI.validate_param(name, "SearchVectorFlatOptions", :minItems, val, 1)
    end

    if name === Symbol("operator")
        OpenAPI.validate_param(name, "SearchVectorFlatOptions", :enum, val,             ["near",
                "containsAll",
                "containsAny",
                "equals",
                "notEquals",
                "startsWith",
                "greaterThan",
                "greaterThanOrEquals",
                "lessThan",
                "lessThanOrEquals",
                "inRange"])
    end


    if name === Symbol("limit")
        OpenAPI.validate_param(name, "SearchVectorFlatOptions", :maximum, val, 75, false)
        OpenAPI.validate_param(name, "SearchVectorFlatOptions", :minimum, val, 1, false)
    end


end
