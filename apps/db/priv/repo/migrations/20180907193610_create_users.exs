defmodule DB.Repo.Migrations.CreateUsers do
  use Ecto.Migration
  import Ecto.SoftDelete.Migration

  def change do

   execute("CREATE EXTENSION citext;")

    create table(:users) do
      add :username, :string
      add :auth_provider, :string
      add :email, :string
      add :hash, :string
      add :status, :string
      add :fb_user_id, :string
      add :google_user_id, :string
      add :password_digest, :string
      timestamps()
      soft_delete_columns()
    end

     create unique_index(:users, [:hash])

  end
end
