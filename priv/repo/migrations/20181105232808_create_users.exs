defmodule SimpleLleksah.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :name, :string
      add :password_hash, :string
      add :is_premium, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
