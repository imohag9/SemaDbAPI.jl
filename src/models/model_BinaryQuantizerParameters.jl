

""" BinaryQuantizerParameters
Converts vectors to boolean values. Works effectively only if vector features are already binary or are normally distributed.

    BinaryQuantizerParameters(;
        threshold=nothing,
        triggerThreshold=10000,
        distanceMetric=nothing,
    )

    - threshold::Float64 : Optional initial threshold for binary quantization, if not provided, it will be calculated at trigger threshold.
    - triggerThreshold::Float64 : Optional trigger threshold for binary quantization.
    - distanceMetric::String : The distance metric to use for binary quantization after the vectors are encoded
"""
Base.@kwdef mutable struct BinaryQuantizerParameters <: OpenAPI.APIModel
    threshold::Union{Nothing, Float64} = nothing
    triggerThreshold::Union{Nothing, Float64} = 10000
    distanceMetric::Union{Nothing, String} = nothing

    function BinaryQuantizerParameters(threshold, triggerThreshold, distanceMetric, )
        o = new(threshold, triggerThreshold, distanceMetric, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type BinaryQuantizerParameters

const _property_types_BinaryQuantizerParameters = Dict{Symbol,String}(Symbol("threshold")=>"Float64", Symbol("triggerThreshold")=>"Float64", Symbol("distanceMetric")=>"String", )
OpenAPI.property_type(::Type{ BinaryQuantizerParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_BinaryQuantizerParameters[name]))}

function OpenAPI.check_required(o::BinaryQuantizerParameters)
    o.distanceMetric === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::BinaryQuantizerParameters)
    OpenAPI.validate_property(BinaryQuantizerParameters, Symbol("threshold"), o.threshold)
    OpenAPI.validate_property(BinaryQuantizerParameters, Symbol("triggerThreshold"), o.triggerThreshold)
    OpenAPI.validate_property(BinaryQuantizerParameters, Symbol("distanceMetric"), o.distanceMetric)
end

function OpenAPI.validate_property(::Type{ BinaryQuantizerParameters }, name::Symbol, val)


    if name === Symbol("triggerThreshold")
        OpenAPI.validate_param(name, "BinaryQuantizerParameters", :maximum, val, 50000, false)
        OpenAPI.validate_param(name, "BinaryQuantizerParameters", :minimum, val, 0, false)
    end

    if name === Symbol("distanceMetric")
        OpenAPI.validate_param(name, "BinaryQuantizerParameters", :enum, val, ["hamming", "jaccard"])
    end

end
