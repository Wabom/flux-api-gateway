defmodule FluxApiGatewayWeb.Utils.StringUtils do
  def take_prefix(full, prefix) do

    base = String.length(prefix)

    String.slice(full, base, String.length(full) - base)

  end

  def get_fullpath(query_string, path) do
    if query_string == "" do
      path
    else
      path <> "?#{query_string}"
    end
  end
end
