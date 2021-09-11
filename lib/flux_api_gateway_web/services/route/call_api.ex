defmodule FluxApiGatewayWeb.Services.Route.CallApi do
  alias FluxApiGatewayWeb.Utils.StringUtils

  @url System.get_env("URL", "http://localhost:80")

  def call_api {:error, message}, _conn, _query_string, _body do
    {:error, message}
  end

  def call_api {:ok, access_path}, conn, query_string, body do

    full_path = StringUtils.get_fullpath(query_string, access_path)

    method = conn.method
    |> String.downcase
    |> :erlang.binary_to_atom
    url = "#{@url}#{full_path}"
    headers = conn.req_headers

    request = %HTTPoison.Request{
      method: method,
      url: url,
      body: body,
      headers: headers
    }

    HTTPoison.request(request)
  end
end
