

"""IndexTextParameters
Parameters for text indexing

    IndexTextParameters(;
        analyser="standard",
    )

    - analyser::String
"""
Base.@kwdef mutable struct IndexTextParameters <: OpenAPI.APIModel
    analyser::Union{Nothing, String} = "standard"

    function IndexTextParameters(analyser, )
        o = new(analyser, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type IndexTextParameters

const _property_types_IndexTextParameters = Dict{Symbol,String}(Symbol("analyser")=>"String", )
OpenAPI.property_type(::Type{ IndexTextParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IndexTextParameters[name]))}

function OpenAPI.check_required(o::IndexTextParameters)
    o.analyser === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::IndexTextParameters)
    OpenAPI.validate_property(IndexTextParameters, Symbol("analyser"), o.analyser)
end

function OpenAPI.validate_property(::Type{ IndexTextParameters }, name::Symbol, val)

    if name === Symbol("analyser")
        OpenAPI.validate_param(name, "IndexTextParameters", :enum, val, ["standard"])
    end

end
