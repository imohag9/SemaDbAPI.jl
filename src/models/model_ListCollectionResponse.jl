

"""ListCollectionResponse

    ListCollectionResponse(;
        collections=nothing,
    )

    - collections::Vector{ListCollectionResponseCollectionsInner}
"""
Base.@kwdef mutable struct ListCollectionResponse <: OpenAPI.APIModel
    collections::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{ListCollectionResponseCollectionsInner} }

    function ListCollectionResponse(collections, )
        o = new(collections, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type ListCollectionResponse

const _property_types_ListCollectionResponse = Dict{Symbol,String}(Symbol("collections")=>"Vector{ListCollectionResponseCollectionsInner}", )
OpenAPI.property_type(::Type{ ListCollectionResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ListCollectionResponse[name]))}

function OpenAPI.check_required(o::ListCollectionResponse)
    true
end

function OpenAPI.validate_properties(o::ListCollectionResponse)
    OpenAPI.validate_property(ListCollectionResponse, Symbol("collections"), o.collections)
end

function OpenAPI.validate_property(::Type{ ListCollectionResponse }, name::Symbol, val)

end
