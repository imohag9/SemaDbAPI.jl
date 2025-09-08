
using URIs
struct SemaDBClient
    api_key::Union{Nothing,String}
    base_url::String
    _api::OpenAPI.Clients.Client
    function SemaDBClient(base_url::String;api_key::Union{Nothing,String}=nothing)

        url = URI(base_url);
        URIs.isvalid(url);
        _api = OpenAPI.Clients.Client(base_url)
        new(api_key,base_url, _api)
    end 
end

function Base.show(io::IO, client::SemaDBClient)
    # Determine if it's a production URL or localhost
    is_local = occursin(r"localhost|127\.0\.0\.1|0\.0\.0\.0", client.base_url)
    url_type = is_local ? "Local" : "Remote"
    
    # Mask API key for security
    masked_key = !isnothing(client.api_key) ? 
                 string(repeat("*", length(client.api_key) -10), last(client.api_key, 6)) : 
                 ""
    
    print(io, "SemaDBClient($url_type connection)")

    print(io, "\n├─ URL: ", client.base_url)
    length(masked_key) > 1 && print(io, "\n└─ API Key: ", masked_key)

end

export SemaDBClient