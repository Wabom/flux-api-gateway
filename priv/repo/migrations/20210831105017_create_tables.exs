defmodule FluxApiGateway.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :name, :string, size: 50
      add :request_path, :string, size: 255, default: ""
      add :path, :string, size: 255, default: ""

      timestamps()
    end

    create unique_index(:routes, [:request_path])

    create table(:roles) do
      add :name, :string, size: 50

      timestamps()
    end

    create unique_index(:roles, [:name])

    create table(:roles_routes) do
      add :route_id, references(:routes)
      add :role_id, references(:roles)

      timestamps()
    end

  end
end
