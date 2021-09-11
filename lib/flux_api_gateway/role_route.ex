defmodule FluxApiGateway.RoleRoute do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:route_id, :role_id]

  schema "roles_routes" do
    field :route_id, :integer
    field :role_id, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
