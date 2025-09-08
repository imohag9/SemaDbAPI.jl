

"""SearchRequest

    SearchRequest(;
        query=nothing,
        select=nothing,
        sort=nothing,
        offset=0,
        limit=10,
    )

    - query::Query
    - select::Vector{String} : A list of properties to return in the search results. If not provided, all properties are returned.
    - sort::Vector{SortOption} : A list of sort options for the search results. The search results are sorted by the first sort option, then the second, and so on.
    - offset::Int64 : The number of points to skip in the search results
    - limit::Int64 : Maximum number of points to return
"""
Base.@kwdef mutable struct SearchRequest <: OpenAPI.APIModel
    query = nothing # spec type: Union{ Nothing, Query }
    select::Union{Nothing, Vector{String}} = nothing
    sort::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{SortOption} }
    offset::Union{Nothing, Int64} = nothing
    limit::Union{Nothing, Int64} = 10

    function SearchRequest(query, select, sort, offset, limit, )
        o = new(query, select, sort, offset, limit, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SearchRequest

const _property_types_SearchRequest = Dict{Symbol,String}(Symbol("query")=>"Query", Symbol("select")=>"Vector{String}", Symbol("sort")=>"Vector{SortOption}", Symbol("offset")=>"Int64", Symbol("limit")=>"Int64", )
OpenAPI.property_type(::Type{ SearchRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SearchRequest[name]))}

function OpenAPI.check_required(o::SearchRequest)
    o.query === nothing && (return false)
    o.limit === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SearchRequest)
    OpenAPI.validate_property(SearchRequest, Symbol("query"), o.query)
    OpenAPI.validate_property(SearchRequest, Symbol("select"), o.select)
    OpenAPI.validate_property(SearchRequest, Symbol("sort"), o.sort)
    OpenAPI.validate_property(SearchRequest, Symbol("offset"), o.offset)
    OpenAPI.validate_property(SearchRequest, Symbol("limit"), o.limit)
end

function OpenAPI.validate_property(::Type{ SearchRequest }, name::Symbol, val)



    if name === Symbol("sort")
        OpenAPI.validate_param(name, "SearchRequest", :maxItems, val, 10)
    end

    if name === Symbol("offset")
        OpenAPI.validate_param(name, "SearchRequest", :minimum, val, 0, false)
    end

    if name === Symbol("limit")
        OpenAPI.validate_param(name, "SearchRequest", :maximum, val, 100, false)
        OpenAPI.validate_param(name, "SearchRequest", :minimum, val, 1, false)
    end
end
