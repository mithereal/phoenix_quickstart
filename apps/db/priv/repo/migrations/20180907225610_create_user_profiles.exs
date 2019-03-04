defmodule DB.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :name, :string
      add :phone, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :image, :string

    end

  end

  def down do
    execute "DROP user_profiles"
  end

end