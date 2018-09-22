defmodule Kwerk.Posting.CategoryTest do
  use Kwerk.DataCase

  alias Kwerk.Posting.Category

  @valid_attrs %{name: "Philippines", status: "active"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    refute changeset.valid?
  end
end
