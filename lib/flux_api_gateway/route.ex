defmodule FluxApiGateway.Route do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :request_path, :path]

  schema "routes" do
    field :name, :string, size: 50
    field :request_path, :string, size: 255, default: ""
    field :path, :string, size: 255, default: ""

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required([:name, :path])
    |> validate_length(:name, min: 2)
  end
end
