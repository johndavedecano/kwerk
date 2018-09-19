defmodule Kwerk.Posting.PostFeature do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts_features" do

    timestamps()
  end

  @doc false
  def changeset(post_feature, attrs) do
    post_feature
    |> cast(attrs, [])
    |> validate_required([])
  end
end
