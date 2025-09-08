

"""ProductQuantizerParameters
Uses the product quantization to reduce the memory footprint of the vectors. It may be slower and less accurate.

    ProductQuantizerParameters(;
        numCentroids=256,
        numSubVectors=nothing,
        triggerThreshold=10000,
    )

    - numCentroids::Float64 : Number of centroids to quantize to, this is the k* parameter in the paper and is often set to 255 giving 256 centroids (including 0). We are limiting this to maximum of 256 (uint8) to keep the overhead of this process tractable.
    - numSubVectors::Float64 : Number of subvectors / segments / subquantizers to use, this is the m parameter in the paper and is often set to 8.
    - triggerThreshold::Float64 : The trigger threshold is the number of points in the collection that will trigger the quantization process. This is to ensure that the quantization process is only triggered when the collection is large enough to benefit from the memory savings.
"""
Base.@kwdef mutable struct ProductQuantizerParameters <: OpenAPI.APIModel
    numCentroids::Union{Nothing, Float64} = 256
    numSubVectors::Union{Nothing, Float64} = nothing
    triggerThreshold::Union{Nothing, Float64} = 10000

    function ProductQuantizerParameters(numCentroids, numSubVectors, triggerThreshold, )
        o = new(numCentroids, numSubVectors, triggerThreshold, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type ProductQuantizerParameters

const _property_types_ProductQuantizerParameters = Dict{Symbol,String}(Symbol("numCentroids")=>"Float64", Symbol("numSubVectors")=>"Float64", Symbol("triggerThreshold")=>"Float64", )
OpenAPI.property_type(::Type{ ProductQuantizerParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ProductQuantizerParameters[name]))}

function OpenAPI.check_required(o::ProductQuantizerParameters)
    o.numCentroids === nothing && (return false)
    o.numSubVectors === nothing && (return false)
    o.triggerThreshold === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::ProductQuantizerParameters)
    OpenAPI.validate_property(ProductQuantizerParameters, Symbol("numCentroids"), o.numCentroids)
    OpenAPI.validate_property(ProductQuantizerParameters, Symbol("numSubVectors"), o.numSubVectors)
    OpenAPI.validate_property(ProductQuantizerParameters, Symbol("triggerThreshold"), o.triggerThreshold)
end

function OpenAPI.validate_property(::Type{ ProductQuantizerParameters }, name::Symbol, val)

    if name === Symbol("numCentroids")
        OpenAPI.validate_param(name, "ProductQuantizerParameters", :maximum, val, 256, false)
        OpenAPI.validate_param(name, "ProductQuantizerParameters", :minimum, val, 2, false)
    end

    if name === Symbol("numSubVectors")
        OpenAPI.validate_param(name, "ProductQuantizerParameters", :minimum, val, 2, false)
    end

    if name === Symbol("triggerThreshold")
        OpenAPI.validate_param(name, "ProductQuantizerParameters", :maximum, val, 10000, false)
        OpenAPI.validate_param(name, "ProductQuantizerParameters", :minimum, val, 1000, false)
    end
end
