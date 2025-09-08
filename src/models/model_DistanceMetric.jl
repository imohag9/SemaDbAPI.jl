

if !isdefined(@__MODULE__, :DistanceMetric)
    const DistanceMetric = String
else
    @warn("Skipping redefinition of DistanceMetric to String")
end
