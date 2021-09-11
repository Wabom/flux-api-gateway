defmodule FluxApiGatewayWeb.Services.Route.Validation do
  alias FluxApiGateway.Repo

  def auth_validation({:error, _}, _) do
    {:error, "Server error"}
  end

  def auth_validation({:ok, %{status_code: status_code, body: body}}, path) when status_code == 202 do
    value = JSON.decode(body) |> Kernel.elem(1)

    role = value["plan"]["type"]

    allowed = Repo.is_route_allowed(role, path)

    allowed_message allowed
  end

  def auth_validation({:ok, _}, _) do
    {:error, "Invalid token or route"}
  end

  def allowed_message(allowed) do
    case allowed do
      [] -> {:error, "You can't access the route"}
      [value] -> {:ok, value}
    end
  end
end
