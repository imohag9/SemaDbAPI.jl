

"""IndexSchemaValue
Defines what the property is and how it is indexed.

    IndexSchemaValue(;
        type=nothing,
        vectorFlat=nothing,
        vectorVamana=nothing,
        text=nothing,
        string=nothing,
        stringArray=nothing,
    )

    - type::String
    - vectorFlat::IndexVectorFlatParameters
    - vectorVamana::IndexVectorVamanaParameters
    - text::IndexTextParameters
    - string::IndexStringParameters
    - stringArray::IndexStringParameters
"""
Base.@kwdef mutable struct IndexSchemaValue <: OpenAPI.APIModel
    type::Union{Nothing, String} = nothing
    vectorFlat = nothing # spec type: Union{ Nothing, IndexVectorFlatParameters }
    vectorVamana = nothing # spec type: Union{ Nothing, IndexVectorVamanaParameters }
    text = nothing # spec type: Union{ Nothing, IndexTextParameters }
    string = nothing # spec type: Union{ Nothing, IndexStringParameters }
    stringArray = nothing # spec type: Union{ Nothing, IndexStringParameters }

    function IndexSchemaValue(type, vectorFlat, vectorVamana, text, string, stringArray, )
        o = new(type, vectorFlat, vectorVamana, text, string, stringArray, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type IndexSchemaValue

const _property_types_IndexSchemaValue = Dict{Symbol,String}(Symbol("type")=>"String", Symbol("vectorFlat")=>"IndexVectorFlatParameters", Symbol("vectorVamana")=>"IndexVectorVamanaParameters", Symbol("text")=>"IndexTextParameters", Symbol("string")=>"IndexStringParameters", Symbol("stringArray")=>"IndexStringParameters", )
OpenAPI.property_type(::Type{ IndexSchemaValue }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IndexSchemaValue[name]))}

function OpenAPI.check_required(o::IndexSchemaValue)
    true
end

function OpenAPI.validate_properties(o::IndexSchemaValue)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("type"), o.type)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("vectorFlat"), o.vectorFlat)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("vectorVamana"), o.vectorVamana)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("text"), o.text)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("string"), o.string)
    OpenAPI.validate_property(IndexSchemaValue, Symbol("stringArray"), o.stringArray)
end

function OpenAPI.validate_property(::Type{ IndexSchemaValue }, name::Symbol, val)

    if name === Symbol("type")
        OpenAPI.validate_param(name, "IndexSchemaValue", :enum, val, ["vectorFlat", "vectorVamana", "text", "string", "stringArray", "integer", "float"])
    end






end
