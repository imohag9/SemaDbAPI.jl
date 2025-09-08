

"""inline_object

    InlineObject(;
        message=nothing,
    )

    - message::String : A message indicating the result of the operation
"""
Base.@kwdef mutable struct InlineObject <: OpenAPI.APIModel
    message::Union{Nothing, String} = nothing

    function InlineObject(message, )
        o = new(message, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InlineObject

const _property_types_InlineObject = Dict{Symbol,String}(Symbol("message")=>"String", )
OpenAPI.property_type(::Type{ InlineObject }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InlineObject[name]))}

function OpenAPI.check_required(o::InlineObject)
    o.message === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::InlineObject)
    OpenAPI.validate_property(InlineObject, Symbol("message"), o.message)
end

function OpenAPI.validate_property(::Type{ InlineObject }, name::Symbol, val)

end
