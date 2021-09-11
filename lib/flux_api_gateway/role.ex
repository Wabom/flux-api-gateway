defmodule FluxApiGateway.Role do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name]

  schema "roles" do
    field :name, :string, size: 50

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:name, min: 2)
  end
end
