defmodule Kwerk.Account.User do
  use Ecto.Schema

  alias Kwerk.Common.Country
  alias Kwerk.Constants
  alias Kwerk.Utils.Randomizer
  alias Comeonin.Pbkdf2

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string, unique: true
    field :avatar, :map
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
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

    belongs_to :country, Country

    timestamps()
  end

  @required_fields ~w(name email password password_confirmation role country_id)
  @optional_fields ~w(address city state lon lat status)

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

  @valid_statuses ["active", "deleted", "inactive"]

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required([:name, :email, :password, :password_confirmation, :role])
    |> validate_confirmation(:password)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:status, @valid_statuses)
    |> unique_constraint(:email)
    |> foreign_key_constraint(:country_id)
    |> cast_assoc(:country)
    |> put_password_hash
  end


  def update_changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required([:name, :email, :role])
    |> validate_confirmation(:password)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:status, @valid_statuses)
    |> unique_constraint(:email)
    |> foreign_key_constraint(:country_id)
    |> cast_assoc(:country)
    |> put_password_hash
  end
end
