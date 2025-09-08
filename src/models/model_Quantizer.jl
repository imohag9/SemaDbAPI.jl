

"""Quantizer
Applied quantizer to the vectors if any

    Quantizer(;
        type=nothing,
        binary=nothing,
        product=nothing,
    )

    - type::String
    - binary::BinaryQuantizerParameters
    - product::ProductQuantizerParameters
"""
Base.@kwdef mutable struct Quantizer <: OpenAPI.APIModel
    type::Union{Nothing, String} = nothing
    binary = nothing # spec type: Union{ Nothing, BinaryQuantizerParameters }
    product = nothing # spec type: Union{ Nothing, ProductQuantizerParameters }

    function Quantizer(type, binary, product, )
        o = new(type, binary, product, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type Quantizer

const _property_types_Quantizer = Dict{Symbol,String}(Symbol("type")=>"String", Symbol("binary")=>"BinaryQuantizerParameters", Symbol("product")=>"ProductQuantizerParameters", )
OpenAPI.property_type(::Type{ Quantizer }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Quantizer[name]))}

function OpenAPI.check_required(o::Quantizer)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::Quantizer)
    OpenAPI.validate_property(Quantizer, Symbol("type"), o.type)
    OpenAPI.validate_property(Quantizer, Symbol("binary"), o.binary)
    OpenAPI.validate_property(Quantizer, Symbol("product"), o.product)
end

function OpenAPI.validate_property(::Type{ Quantizer }, name::Symbol, val)

    if name === Symbol("type")
        OpenAPI.validate_param(name, "Quantizer", :enum, val, ["none", "binary", "product"])
    end



end
