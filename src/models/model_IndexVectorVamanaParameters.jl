

"""IndexVectorVamanaParameters
Parameters for Vamana indexing

    IndexVectorVamanaParameters(;
        vectorSize=nothing,
        distanceMetric=nothing,
        searchSize=75,
        degreeBound=64,
        alpha=1.2,
        quantizer=nothing,
    )

    - vectorSize::Float64 : The size of the vectors in the collection
    - distanceMetric::DistanceMetric
    - searchSize::Float64 : Determines the scope of the greedy search algorithm. The higher the value, the more exhaustive the search.
    - degreeBound::Float64 : Maximum number of edges of a node in the graph. The higher the value, the denser the graph becomes, slower the search but more accurate.
    - alpha::Float64 : Determines how aggressive the edge pruning is. Higher values reduce pruning, lower values make it more aggressive.
    - quantizer::Quantizer
"""
Base.@kwdef mutable struct IndexVectorVamanaParameters <: OpenAPI.APIModel
    vectorSize::Union{Nothing, Int64} = nothing
    distanceMetric = nothing # spec type: Union{ Nothing, DistanceMetric }
    searchSize::Union{Nothing, Int64} = 75
    degreeBound::Union{Nothing, Int64} = 64
    alpha::Union{Nothing, Float64} = 1.2
    quantizer = nothing # spec type: Union{ Nothing, Quantizer }

    function IndexVectorVamanaParameters(vectorSize, distanceMetric, searchSize, degreeBound, alpha, quantizer, )
        o = new(vectorSize, distanceMetric, searchSize, degreeBound, alpha, quantizer, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type IndexVectorVamanaParameters

const _property_types_IndexVectorVamanaParameters = Dict{Symbol,String}(Symbol("vectorSize")=>"Int64", Symbol("distanceMetric")=>"DistanceMetric", Symbol("searchSize")=>"Int64", Symbol("degreeBound")=>"Int64", Symbol("alpha")=>"Float64", Symbol("quantizer")=>"Quantizer", )
OpenAPI.property_type(::Type{ IndexVectorVamanaParameters }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IndexVectorVamanaParameters[name]))}

function OpenAPI.check_required(o::IndexVectorVamanaParameters)
    o.vectorSize === nothing && (return false)
    o.distanceMetric === nothing && (return false)
    o.searchSize === nothing && (return false)
    o.degreeBound === nothing && (return false)
    o.alpha === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::IndexVectorVamanaParameters)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("vectorSize"), o.vectorSize)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("distanceMetric"), o.distanceMetric)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("searchSize"), o.searchSize)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("degreeBound"), o.degreeBound)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("alpha"), o.alpha)
    OpenAPI.validate_property(IndexVectorVamanaParameters, Symbol("quantizer"), o.quantizer)
end

function OpenAPI.validate_property(::Type{ IndexVectorVamanaParameters }, name::Symbol, val)

    if name === Symbol("vectorSize")
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :maximum, val, 4096, false)
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :minimum, val, 1, false)
    end


    if name === Symbol("searchSize")
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :maximum, val, 75, false)
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :minimum, val, 25, false)
    end

    if name === Symbol("degreeBound")
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :maximum, val, 64, false)
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :minimum, val, 32, false)
    end

    if name === Symbol("alpha")
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :maximum, val, 1.5, false)
        OpenAPI.validate_param(name, "IndexVectorVamanaParameters", :minimum, val, 1.1, false)
    end

end
