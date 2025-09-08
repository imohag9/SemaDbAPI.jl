

"""inline_object_1

    InlineObject1(;
        error=nothing,
    )

    - error::String : An error message hopefully describing the problem
"""
Base.@kwdef mutable struct InlineObject1 <: OpenAPI.APIModel
    error::Union{Nothing, String} = nothing

    function InlineObject1(error, )
        o = new(error, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InlineObject1

const _property_types_InlineObject1 = Dict{Symbol,String}(Symbol("error")=>"String", )
OpenAPI.property_type(::Type{ InlineObject1 }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InlineObject1[name]))}

function OpenAPI.check_required(o::InlineObject1)
    o.error === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::InlineObject1)
    OpenAPI.validate_property(InlineObject1, Symbol("error"), o.error)
end

function OpenAPI.validate_property(::Type{ InlineObject1 }, name::Symbol, val)

end
