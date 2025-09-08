

"""ListCollectionResponse_collections_inner

    ListCollectionResponseCollectionsInner(;
        id=nothing,
    )

    - id::String : The unique identifier of the collection
"""
Base.@kwdef mutable struct ListCollectionResponseCollectionsInner <: OpenAPI.APIModel
    id::Union{Nothing, String} = nothing

    function ListCollectionResponseCollectionsInner(id, )
        o = new(id, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type ListCollectionResponseCollectionsInner

const _property_types_ListCollectionResponseCollectionsInner = Dict{Symbol,String}(Symbol("id")=>"String", )
OpenAPI.property_type(::Type{ ListCollectionResponseCollectionsInner }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ListCollectionResponseCollectionsInner[name]))}

function OpenAPI.check_required(o::ListCollectionResponseCollectionsInner)
    true
end

function OpenAPI.validate_properties(o::ListCollectionResponseCollectionsInner)
    OpenAPI.validate_property(ListCollectionResponseCollectionsInner, Symbol("id"), o.id)
end

function OpenAPI.validate_property(::Type{ ListCollectionResponseCollectionsInner }, name::Symbol, val)

    if name === Symbol("id")
        OpenAPI.validate_param(name, "ListCollectionResponseCollectionsInner", :pattern, val, r"^[a-z0-9]{3,24}$")
    end
end
