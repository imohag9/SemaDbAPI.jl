
const STATUS_SUCCESS = 200
const _returntypes_create_collection = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => InlineObject,
    Regex("^" * replace("403", "x" => ".") * "\$") => InlineObject1,
    Regex("^" * replace("409", "x" => ".") * "\$") => InlineObject1
)

function _oacinternal_create_collection(client::SemaDBClient, user_id::String,
        create_collection_request::CreateCollectionRequest;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "POST", _returntypes_create_collection,
        "/collections", [], create_collection_request)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])

    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end

    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)

    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json"])
    return _ctx
end

"""Create a new collection

Creates a new collection if it does not already exist. The maximum number of collections per user is restricted based on the plan. Before you can insert and search points, you must create a collection.

Params:
- create_collection_request::CreateCollectionRequest (required)

Return: InlineObject, OpenAPI.Clients.ApiResponse
"""
function create_collection(client::SemaDBClient, user_id::String,
        create_collection_request::CreateCollectionRequest;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_create_collection(
        client, user_id, create_collection_request; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_get_collection = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => GetCollectionResponse,
    Regex("^" * replace("503", "x" => ".") * "\$") => InlineObject1
)

function _oacinternal_get_collection(
        client::SemaDBClient, user_id::String, collection_id::String;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "GET", _returntypes_get_collection,
        "/collections/{collectionId}", [])
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, [])
    return _ctx
end

"""Get the details of a collection

This endpoint attempts to also list the shards currently available in the collection. Some shards may be temporarily unavailable. In that case, you can retry at a future time.

Params:
- collection_id::String (required)

Return: GetCollectionResponse, OpenAPI.Clients.ApiResponse
"""
function get_collection(client::SemaDBClient, user_id::String, collection_id::String;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_get_collection(client, user_id, collection_id; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_delete_collection = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => InlineObject,
    Regex("^" * replace("202", "x" => ".") * "\$") => InlineObject
)

function _oacinternal_delete_collection(
        client::SemaDBClient, user_id::String, collection_id::String;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "DELETE", _returntypes_delete_collection,
        "/collections/{collectionId}", [])
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String

    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, [])
    return _ctx
end

"""Delete a collection

Deletes a collection and all of its points. This operation is irreversible. If you want to delete only some points, use the bulk delete endpoint. If some shards are temporarily unavailable, the operation will still succeed, but some of the data will be deleted in the future.

Params:
- collection_id::String (required)

Return: InlineObject, OpenAPI.Clients.ApiResponse
"""
function delete_collection(client::SemaDBClient, user_id::String, collection_id::String;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_delete_collection(client, user_id, collection_id; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_list_collections = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => ListCollectionResponse,
)

function _oacinternal_list_collections(
        client::SemaDBClient, user_id::String; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(client._api, "GET",
        _returntypes_list_collections, "/collections", [])
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, [])
    return _ctx
end

"""List user collections

Returns a list of all collections for the current user. The list is not sorted by any value and the order may change between requests.

Params:

Return: ListCollectionResponse, OpenAPI.Clients.ApiResponse
"""
function list_collections(
        client::SemaDBClient, user_id::String; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_list_collections(client, user_id; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_delete_point = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => DeletePointsResponse,
)

function _oacinternal_delete_point(
        client::SemaDBClient, user_id::String, collection_id::String,
        delete_points_request::DeletePointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "DELETE", _returntypes_delete_point,
        "/collections/{collectionId}/points", [], delete_points_request)
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end

    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json"])
    return _ctx
end

"""Delete points by id

Bulk delete points based on id. This endpoint does not check if the points exist. If you attempt to delete a point that does not exist, it will be ignored and included in the failedPoints list.

Params:
- collection_id::String (required)
- delete_points_request::DeletePointsRequest (required)

Return: DeletePointsResponse, OpenAPI.Clients.ApiResponse
"""
function delete_point(client::SemaDBClient, user_id::String, collection_id::String,
        delete_points_request::DeletePointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_delete_point(
        client, user_id, collection_id, delete_points_request; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_insert_point = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => InsertPointsResponse,
    Regex("^" * replace("403", "x" => ".") * "\$") => InlineObject1,
    Regex("^" * replace("503", "x" => ".") * "\$") => InlineObject1
)

function _oacinternal_insert_point(
        client::SemaDBClient, user_id::String, collection_id::String,
        insert_point_request::InsertPointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "POST", _returntypes_insert_point,
        "/collections/{collectionId}/points", [], insert_point_request)
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json"])
    return _ctx
end

"""Insert new points into the collection

This endpoint assumes all points to be inserted are new points and does not check for duplication. It is important to ensure consistency of the database you do not insert duplicate points. If you are unsure if a point exists, you can leave the id field blank and the database will assign a new id. *For cosine distance, you must normalise the vectors prior to inserting them.*

Params:
- collection_id::String (required)
- insert_point_request::InsertPointsRequest (required)

Return: InsertPointsResponse, OpenAPI.Clients.ApiResponse
"""
function insert_point(client::SemaDBClient, user_id::String, collection_id::String,
        insert_point_request::InsertPointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_insert_point(
        client, user_id, collection_id, insert_point_request; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_search_point = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => SearchPointsResponse,
)

function _oacinternal_search_point(
        client::SemaDBClient, user_id::String, collection_id::String, search_request::SearchRequest;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "POST", _returntypes_search_point,
        "/collections/{collectionId}/points/search", [], search_request)
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json"])
    return _ctx
end

"""Fast index based search

This endpoint allows searching for points in a collection using the index. The search is based on the index schema of the collection.

Params:
- collection_id::String (required)
- search_request::SearchRequest (required)

Return: SearchPointsResponse, OpenAPI.Clients.ApiResponse
"""
function search_point(
        client::SemaDBClient, user_id::String, collection_id::String, search_request::SearchRequest;
        plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_search_point(
        client, user_id, collection_id, search_request; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

const _returntypes_update_point = Dict{Regex, Type}(
    Regex("^" * replace("200", "x" => ".") * "\$") => UpdatePointsResponse,
)

function _oacinternal_update_point(
        client::SemaDBClient, user_id::String, collection_id::String,
        update_points_request::UpdatePointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = OpenAPI.Clients.Ctx(
        client._api, "PUT", _returntypes_update_point,
        "/collections/{collectionId}/points", [], update_points_request)
    OpenAPI.Clients.set_param(_ctx.path, "collectionId", collection_id)  # type String
    if startswith(client.base_url,"https")
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Key", client.api_key)
        OpenAPI.Clients.set_param(_ctx.header, "X-RapidAPI-Host", client.base_url)
    end
    ### To be verified in rapid API
    OpenAPI.Clients.set_param(_ctx.header, "X-User-Id", user_id)
    OpenAPI.Clients.set_param(_ctx.header, "X-Plan-Id", plan_id)
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json"])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json"])
    return _ctx
end

"""Update existing points with new data

This endpoint allows updating point vectors and metadata. It does not allow updating the point id. If you want to update the id, you must delete the point and insert a new point. The points are required to exist before you can update them. You can check the failedPoints to see which points failed to update and potentially why.

Params:
- collection_id::String (required)
- update_points_request::UpdatePointsRequest (required)

Return: UpdatePointsResponse, OpenAPI.Clients.ApiResponse
"""
function update_point(client::SemaDBClient, user_id::String, collection_id::String,
        update_points_request::UpdatePointsRequest; plan_id::Union{Nothing, String} = "BASIC")
    _ctx = _oacinternal_update_point(
        client, user_id, collection_id, update_points_request; plan_id = plan_id)

    try
        result = OpenAPI.Clients.exec(_ctx)
        if result[2].status ≠ STATUS_SUCCESS
            error("$(result[2].message ) \n")
        else
            return result[1]
        end

    catch e
        if e isa OpenAPI.Clients.ApiException
            error("$(e.error.message) \n")
        else
            rethrow()
        end
    end
end

export create_collection
export delete_collection
export list_collections

export get_collection

export insert_point
export search_point
export update_point
export delete_point
