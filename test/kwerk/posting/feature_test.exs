defmodule Kwerk.Posting.FeatureTest do
  use Kwerk.DataCase

  alias Kwerk.Posting.Feature

  @valid_attrs %{name: "Philippines", status: "active"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Feature.changeset(%Feature{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Feature.changeset(%Feature{}, @invalid_attrs)
    refute changeset.valid?
  end
end
