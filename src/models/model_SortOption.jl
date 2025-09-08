

"""SortOption
Sort options for search results. The field is the property to sort by and the order is the direction to sort in.

    SortOption(;
        property=nothing,
        descending=false,
    )

    - property::String
    - descending::Bool
"""
Base.@kwdef mutable struct SortOption <: OpenAPI.APIModel
    property::Union{Nothing, String} = nothing
    descending::Union{Nothing, Bool} = false

    function SortOption(property, descending, )
        o = new(property, descending, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type SortOption

const _property_types_SortOption = Dict{Symbol,String}(Symbol("property")=>"String", Symbol("descending")=>"Bool", )
OpenAPI.property_type(::Type{ SortOption }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SortOption[name]))}

function OpenAPI.check_required(o::SortOption)
    o.property === nothing && (return false)
    o.descending === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::SortOption)
    OpenAPI.validate_property(SortOption, Symbol("property"), o.property)
    OpenAPI.validate_property(SortOption, Symbol("descending"), o.descending)
end

function OpenAPI.validate_property(::Type{ SortOption }, name::Symbol, val)


end
