

"""Query
A query object that can be used to perform search. The query object can contain multiple filters, each with a property and a value. Use _and and _or to combine queries.

    Query(;
        property=nothing,
        vectorFlat=nothing,
        vectorVamana=nothing,
        text=nothing,
        string=nothing,
        integer=nothing,
        float=nothing,
        stringArray=nothing,
        _and=nothing,
        _or=nothing,
    )

    - property::String
    - vectorFlat::SearchVectorFlatOptions
    - vectorVamana::SearchVectorVamanaOptions
    - text::SearchTextOptions
    - string::SearchStringOptions
    - integer::SearchNumberOptions
    - float::SearchNumberOptions
    - stringArray::SearchStringArrayOptions
    - _and::Vector{Query}
    - _or::Vector{Query}
"""
Base.@kwdef mutable struct Query <: OpenAPI.APIModel
    property::Union{Nothing, String} = nothing
    vectorFlat = nothing # spec type: Union{ Nothing, SearchVectorFlatOptions }
    vectorVamana = nothing # spec type: Union{ Nothing, SearchVectorVamanaOptions }
    text = nothing # spec type: Union{ Nothing, SearchTextOptions }
    string = nothing # spec type: Union{ Nothing, SearchStringOptions }
    integer = nothing # spec type: Union{ Nothing, SearchNumberOptions }
    float = nothing # spec type: Union{ Nothing, SearchNumberOptions }
    stringArray = nothing # spec type: Union{ Nothing, SearchStringArrayOptions }
    _and::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Query} }
    _or::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Query} }

    function Query(property, vectorFlat, vectorVamana, text, string, integer, float, stringArray, _and, _or, )
        o = new(property, vectorFlat, vectorVamana, text, string, integer, float, stringArray, _and, _or, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type Query

const _property_types_Query = Dict{Symbol,String}(Symbol("property")=>"String", Symbol("vectorFlat")=>"SearchVectorFlatOptions", Symbol("vectorVamana")=>"SearchVectorVamanaOptions", Symbol("text")=>"SearchTextOptions", Symbol("string")=>"SearchStringOptions", Symbol("integer")=>"SearchNumberOptions", Symbol("float")=>"SearchNumberOptions", Symbol("stringArray")=>"SearchStringArrayOptions", Symbol("_and")=>"Vector{Query}", Symbol("_or")=>"Vector{Query}", )
OpenAPI.property_type(::Type{ Query }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Query[name]))}

function OpenAPI.check_required(o::Query)
    o.property === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::Query)
    OpenAPI.validate_property(Query, Symbol("property"), o.property)
    OpenAPI.validate_property(Query, Symbol("vectorFlat"), o.vectorFlat)
    OpenAPI.validate_property(Query, Symbol("vectorVamana"), o.vectorVamana)
    OpenAPI.validate_property(Query, Symbol("text"), o.text)
    OpenAPI.validate_property(Query, Symbol("string"), o.string)
    OpenAPI.validate_property(Query, Symbol("integer"), o.integer)
    OpenAPI.validate_property(Query, Symbol("float"), o.float)
    OpenAPI.validate_property(Query, Symbol("stringArray"), o.stringArray)
    OpenAPI.validate_property(Query, Symbol("_and"), o._and)
    OpenAPI.validate_property(Query, Symbol("_or"), o._or)
end

function OpenAPI.validate_property(::Type{ Query }, name::Symbol, val)










end
