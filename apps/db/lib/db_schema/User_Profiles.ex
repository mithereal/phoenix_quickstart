defmodule DB.Schema.User.Profile do

  use Ecto.Schema

  import Ecto.Changeset

  alias DB.Schema.User

  schema "user_profiles" do
    field :name, :string
    field :phone, :string
    field :address, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    field :image, :string

    belongs_to :user, User
  end

  @params ~w(name phone address city state zip image)a
  @required_fields ~w(name phone address city state zip)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, @params)
    |> validate_required(@required_fields)
  end

end
