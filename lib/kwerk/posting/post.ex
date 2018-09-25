defmodule Kwerk.Posting.Post do
  use Ecto.Schema

  import Ecto.Changeset

  alias Kwerk.Account.User
  alias Kwerk.Common.Country
  alias Kwerk.Posting.Category
  alias Kwerk.Posting.PostSchedule
  alias Kwerk.Posting.PostImage

  schema "posts" do
    field :title, :string
    field :description, :string
    field :policies, :string
    field :email, :string
    field :thumbnail, :map
    field :cover, :map
    field :max_occupants, :integer
    field :payment_type, :string, default: "monthly"
    field :payment_amount, :float, default: 0
    field :address, :string
    field :city, :string
    field :state, :string
    field :lon, :string
    field :lat, :string
    field :status, :string, default: "inactive"
    belongs_to :user, User
    belongs_to :category, Category
    belongs_to :country, Country
    has_one :schedule, PostSchedule
    has_many :images, PostImage

    timestamps()
  end

  @valid_types ["hourly", "daily", "weekly", "monthly", "quarterly", "yearly"]

  @valid_status ["active", "inactive", "deleted"]

  @fields [
    :title,
    :description,
    :policies,
    :email,
    :thumbnail,
    :cover,
    :max_occupants,
    :payment_type,
    :payment_amount,
    :address,
    :city,
    :state,
    :lon,
    :lat,
    :status,
    :user_id,
    :category_id,
    :country_id,
    :mon,
    :tue,
    :wed,
    :thu,
    :fri,
    :sat,
    :sun
  ]

  @required_fields [
    :title,
    :description,
    :policies,
    :email,
    :thumbnail,
    :cover,
    :max_occupants,
    :payment_type,
    :payment_amount,
    :address,
    :city,
    :state,
    :lon,
    :lat,
    :status,
    :user_id,
    :category_id,
    :country_id,
  ]

  @doc false
  def create_changeset(post, attrs) do
    post
    |> cast(attrs, @fields)
    |> put_change(:status, "active")
    |> validate_required(@required_fields)
    |> validate_inclusion(:status, @valid_status)
    |> validate_inclusion(:payment_type, @valid_types)
    |> validate_number(:max_occupants, greater_than: 0)
    |> validate_format(:email, ~r/@/)
    |> assoc_constraint(:user, message: "User does not exists")
    |> assoc_constraint(:category, message: "Category does not exists")
    |> assoc_constraint(:country, message: "Country does not exists")
  end
end
