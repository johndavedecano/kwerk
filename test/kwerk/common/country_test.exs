defmodule Kwerk.Common.CountryTest do
  use Kwerk.DataCase

  alias Kwerk.Common.Country

  @valid_attrs %{name: "Philippines", code: "PH"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Country.changeset(%Country{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Country.changeset(%Country{}, @invalid_attrs)
    refute changeset.valid?
  end
end
