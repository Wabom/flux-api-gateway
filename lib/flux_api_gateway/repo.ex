defmodule FluxApiGateway.Repo do
  use Ecto.Repo,
    otp_app: :flux_api_gateway,
    adapter: Ecto.Adapters.Postgres
  import Ecto.Query, only: [from: 2]
  alias FluxApiGateway.{Route, RoleRoute}

  def is_route_allowed(role, path) do

    query = from rol in "roles",
          join: rr in RoleRoute,
          join: rou in Route,
          on: rol.id == rr.role_id and rr.route_id == rou.id,
          where: (rol.name == "all" or rol.name == ^role) and rou.request_path == ^path,
          select: rou.path

    all(query)
  end
end
