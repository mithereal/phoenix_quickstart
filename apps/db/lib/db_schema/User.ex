defmodule DB.Schema.User do

    use Ecto.Schema

    import Ecto.Changeset
    import Ecto.UUID
    import Ecto.SoftDelete.Schema

    alias DB.Schema.User.Profile
    alias DB.Schema.User

    schema "users" do
      field :email, :string
      field :auth_provider, :string
      field :password_digest, :string
      field :password, :string, virtual: true
      field :password_confirmation, :string, virtual: true
      field :status, :string
      field :username, :string
      field :hash, :string
      field :fb_user_id, :string
      field :google_user_id, :string

      has_one :profile, Profile


      soft_delete_schema()
    end

  @params ~w( username email password password_confirmation status )a
  @required_fields ~w( username  )a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

    def changeset(struct, params) do
    struct
    |> cast(params, @params)
    |> validate_required(@required_fields)
    |> put_assoc(:profile, params.profile)

  end

def fetch(x)do
nil
end

end