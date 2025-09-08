

"""IndexVectorFlatParameters
Parameters for flat indexing. Flat indexing is the simplest form of indexing, where the search is exhaustive.

    IndexVectorFlatParameters(;
        vectorSize=nothing,
        distanceMetric=nothing,
        quantizer=nothing,
    )

    - vectorSize::Float64 : The size of the vectors in the collection
    - distanceMetric::DistanceMetric
    - quantizer::Quantizer
"""
Base.@kwdef mutable struct IndexVectorFlatParameters <: OpenAPI.APIModel
    vectorSize::Union{Nothing, Float64} = nothing
    distanceMetric = nothing # spec type: Union{ Nothing, DistanceMetric }
    quantizer = nothing # spec type: Union{ Nothing, Quantizer }

    function IndexVectorFlatParameters(vectorSize, distanceMetric, quantizer, )
        o = new(vectorSize, distanceMetric, quantizer, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type IndexVectorFlatParameters

const _property_types_IndexVectorFlatParameters = Dict{Symbol,String}(Symbol("vectorSize")=>"Float64", Symbol("distanceMetric")=>"DistanceMetric", Symbol("quantizer")=>"Quantizer", )
OpenAPI.property_type(::Type{ IndexVectorFlatParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IndexVectorFlatParameters[name]))}

function OpenAPI.check_required(o::IndexVectorFlatParameters)
    o.vectorSize === nothing && (return false)
    o.distanceMetric === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::IndexVectorFlatParameters)
    OpenAPI.validate_property(IndexVectorFlatParameters, Symbol("vectorSize"), o.vectorSize)
    OpenAPI.validate_property(IndexVectorFlatParameters, Symbol("distanceMetric"), o.distanceMetric)
    OpenAPI.validate_property(IndexVectorFlatParameters, Symbol("quantizer"), o.quantizer)
end

function OpenAPI.validate_property(::Type{ IndexVectorFlatParameters }, name::Symbol, val)

    if name === Symbol("vectorSize")
        OpenAPI.validate_param(name, "IndexVectorFlatParameters", :maximum, val, 4096, false)
        OpenAPI.validate_param(name, "IndexVectorFlatParameters", :minimum, val, 1, false)
    end


end
