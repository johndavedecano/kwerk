defmodule Kwerk.Account.User do
  use Ecto.Schema

  alias Kwerk.Common
  alias Kwerk.Constants
  alias Kwerk.Account.User
  alias Kwerk.Utils.Randomizer
  alias Comeonin.Pbkdf2

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string, unique: true
    field :avatar, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :address, :string
    field :city, :string
    field :state, :string
    field :lon, :string
    field :lat, :string
    field :status, :string, default: Constants.cSTATUS_INACTIVE
    field :role, :string, default: Constants.cUSER_ROLE_USER
    field :reset_code, :string
    field :reset_code_expiration, :integer
    field :activation_code, :string
    field :activation_code_expiration, :integer

    belongs_to(:country, Common.Country, foreign_key: :countries_id)

    timestamps()
  end

  @doc false
  defp put_activation_code(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :activation_code, Randomizer.generate(20))
      _ ->
        changeset
    end
  end

  def get_expiration_from_now do
    timestamp = DateTime.utc_now |> DateTime.to_unix
    timestamp + 86400 # adds one day
  end

  @doc false
  defp put_activation_code_expiration(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :activation_code_expiration, get_expiration_from_now())
      _ ->
        changeset
    end
  end

  @doc false
  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: p}} ->
        put_change(changeset, :password_hash, Pbkdf2.hashpwsalt(p))
      _ ->
        changeset
    end
  end

  @doc false
  defp put_reset_code(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :reset_code, Randomizer.generate(20))
      _ ->
        changeset
    end
  end

  @doc false
  defp put_reset_code_expiration(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :reset_code_expiration, get_expiration_from_now())
      _ ->
        changeset
    end
  end

  @doc false
  def register(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_confirmation(:password)
    |> put_password_hash
    |> put_activation_code
    |> put_activation_code_expiration
  end

  @doc false
  def login(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_confirmation(:password)
  end

  @doc false
  def forgot(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> put_reset_code
    |> put_reset_code_expiration
  end

  @doc false
  def reset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:password, :reset_code])
    |> validate_required([:password, :reset_code])
    |> validate_confirmation(:password)
    |> put_password_hash
  end
end
