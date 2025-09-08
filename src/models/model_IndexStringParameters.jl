

"""IndexStringParameters
Parameters for string indexing

    IndexStringParameters(;
        caseSensitive=false,
    )

    - caseSensitive::Bool : Whether the string is case sensitive
"""
Base.@kwdef mutable struct IndexStringParameters <: OpenAPI.APIModel
    caseSensitive::Union{Nothing, Bool} = false

    function IndexStringParameters(caseSensitive, )
        o = new(caseSensitive, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type IndexStringParameters

const _property_types_IndexStringParameters = Dict{Symbol,String}(Symbol("caseSensitive")=>"Bool", )
OpenAPI.property_type(::Type{ IndexStringParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IndexStringParameters[name]))}

function OpenAPI.check_required(o::IndexStringParameters)
    o.caseSensitive === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::IndexStringParameters)
    OpenAPI.validate_property(IndexStringParameters, Symbol("caseSensitive"), o.caseSensitive)
end

function OpenAPI.validate_property(::Type{ IndexStringParameters }, name::Symbol, val)

end
