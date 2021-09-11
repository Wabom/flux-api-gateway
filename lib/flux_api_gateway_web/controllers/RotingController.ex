defmodule FluxApiGatewayWeb.RotingController do
  use FluxApiGatewayWeb, :controller
  alias FluxApiGatewayWeb.Utils.StringUtils
  alias FluxApiGatewayWeb.Services.Route.{Validation, CallApi}
  alias FluxApiGateway.Repo

  @url System.get_env("URL", "http://localhost:80")

  def index(conn, params) do

    {:ok, body} = params |> JSON.encode

    path = conn.request_path

    query_string = conn.query_string

    access_path = case get_req_header(conn, "authorization") do
      [bearer_token | _] -> auth_req(bearer_token, path)
      _ -> Repo.is_route_allowed("all", path) |> Validation.allowed_message
    end

    response = CallApi.call_api(access_path, conn, query_string, body)

    response_headers = case response do
      {:ok, response} -> response.headers
      |> Enum.map(fn {key, value} -> {key, value} end)
      |> Enum.filter(fn {key, value} -> not(String.downcase(key) == "transfer-encoding" && value == "chunked") end)
      {:error, _} -> []
    end

    case response do
      {:ok, response} -> conn
        |> merge_resp_headers(response_headers)
        |> send_resp(response.status_code, response.body)
      {:error, response} -> conn
        |> send_resp(500, response)
    end


  end

  defp auth_req(bearer_token, path) do

    token = StringUtils.take_prefix(bearer_token, "Bearer ")

    {:ok, string_token} = JSON.encode(%{token: token})

    token_data = HTTPoison.post("#{@url}/user/validtoken", string_token, [{"Accept", "application/json"}, {"Content-Type", "application/json"}])

    Validation.auth_validation(token_data, path)
  end

end
