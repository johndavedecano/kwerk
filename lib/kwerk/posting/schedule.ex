defmodule Kwerk.Posting.PostSchedule do
  use Ecto.Schema
  import Ecto.Changeset

  alias Kwerk.Posting.Post

  schema "schedules" do
    field :mon, :boolean, default: false
    field :tue, :boolean, default: false
    field :wed, :boolean, default: false
    field :thu, :boolean, default: false
    field :fri, :boolean, default: false
    field :sat, :boolean, default: false
    field :sun, :boolean, default: false
    belongs_to(:country, Post, foreign_key: :post_id)
    timestamps()
  end

  @doc false
  def changeset(post_schedule, attrs) do
    post_schedule
    |> cast(attrs, [:post_id, :mon, :tue, :wed, :thu, :fri, :sat, :sun])
    |> validate_required([:post_id, :mon, :tue, :wed, :thu, :fri, :sat, :sun])
  end
end
