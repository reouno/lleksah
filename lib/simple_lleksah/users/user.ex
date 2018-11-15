defmodule SimpleLleksah.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias SimpleLleksah.Repo
  alias SimpleLleksah.Users.User


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "users" do
    field :email, :string
    field :is_premium, :boolean, default: false
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  # 複数の変更をまとめて一つの単位とする（アトミック）という意味でchangeset
  # this function will be called from create_user in users.ex
  # and then the changeset will be inserted to DB
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :is_premium])
    |> validate_required([:email, :name, :password, :is_premium])
    |> validate_changeset
  end

  defp validate_changeset(user) do
    user
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 10)
    |> validate_format(:password,
                       ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/,
                       [message:
                          "Must include at leaset one lowercase letter, one uppercase letter, and one digit"])
    |> generate_password_hash
  end

  defp generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end

  def find_and_confirm_password(email, password) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_fount}
      user ->
        if Comeonin.Bcrypt.checkpw(password, user.password_hash) do
          {:ok, user}
        else
          {:error, :unauthorized}
        end
    end
  end

end
