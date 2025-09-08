
"""SearchVectorVamanaOptions
Options for searching vectors with Vamana indexing. The larger the search size the longer the search will take.

    SearchVectorVamanaOptions(;
        vector=nothing,
        operator=nothing,
        searchSize=75,
        limit=10,
        filter=nothing,
        weight=1,
    )

    - vector::Vector{Int64} : A vector with a fixed number of dimensions
    - operator::String
    - searchSize::Float64 : Determines the scope of the greedy search algorithm. The higher the value, the more exhaustive the search.
    - limit::Float64 : Maximum number of points to search
    - filter::Query
    - weight::Float64 : The weight of the vector search, the higher the value, the more important the vector search is.
"""
Base.@kwdef mutable struct SearchVectorVamanaOptions <: OpenAPI.APIModel
    vector::Union{Nothing, Vector{Int64}} = nothing
    operator::Union{Nothing, String} = nothing
    searchSize::Union{Nothing, Int64} = 75
    limit::Union{Nothing, Int64} = 10
    filter = nothing # spec type: Union{ Nothing, Query }
    weight::Union{Nothing, Float64} = nothing

    function SearchVectorVamanaOptions(vector, operator, searchSize, limit, filter, weight)
        o = new(vector, operator, searchSize, limit, filter, weight)
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchVectorVamanaOptions

const _property_types_SearchVectorVamanaOptions = Dict{Symbol, String}(
    Symbol("vector") => "Vector{Int64}", Symbol("operator") => "String",
    Symbol("searchSize") => "Int64", Symbol("limit") => "Int64",
    Symbol("filter") => "Query", Symbol("weight") => "Float64")
function OpenAPI.property_type(::Type{SearchVectorVamanaOptions}, name::Symbol)
    Union{Nothing, eval(Base.Meta.parse(_property_types_SearchVectorVamanaOptions[name]))}
end

function OpenAPI.check_required(o::SearchVectorVamanaOptions)
    o.vector === nothing && (return false)
    o.operator === nothing && (return false)
    o.searchSize === nothing && (return false)
    o.limit === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchVectorVamanaOptions)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("vector"), o.vector)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("operator"), o.operator)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("searchSize"), o.searchSize)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("limit"), o.limit)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("filter"), o.filter)
    OpenAPI.validate_property(SearchVectorVamanaOptions, Symbol("weight"), o.weight)
end

function OpenAPI.validate_property(::Type{SearchVectorVamanaOptions}, name::Symbol, val)
    if name === Symbol("vector")
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :maxItems, val, 4096)
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :minItems, val, 1)
    end

    if name === Symbol("operator")
        OpenAPI.validate_param(name,
            "SearchVectorVamanaOptions",
            :enum,
            val,
            ["near",
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

    if name === Symbol("searchSize")
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :maximum, val, 75, false)
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :minimum, val, 25, false)
    end

    if name === Symbol("limit")
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :maximum, val, 75, false)
        OpenAPI.validate_param(name, "SearchVectorVamanaOptions", :minimum, val, 1, false)
    end
end
