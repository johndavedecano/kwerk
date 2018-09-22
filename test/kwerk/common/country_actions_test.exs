defmodule Kwerk.Common.CountryActionsTest do
  use Kwerk.DataCase

  alias Kwerk.Common.CountryActions

  import Kwerk.Factory

  describe "create country" do
    test "create country with validation error" do
      {:error, changeset} = CountryActions.create_country(%{})
      refute changeset.valid?
    end

    test "create country with success" do
      {:ok, country} = CountryActions.create_country(%{name: "Philippines", code: "ph"})
      assert country.name === "Philippines"
      assert country.code === "ph"
    end
  end

  describe "update country" do
    test "update country with success" do
      country = insert(:country)
      {:ok, result} = CountryActions.update_country(country, %{name: "Philippines", code: "ph"})
      assert result.name === "Philippines"
      assert result.code === "ph"
    end

    test "update country with validation error" do
      country = insert(:country)
      {:error, changeset} = CountryActions.update_country(country, %{name: ""})
      refute changeset.valid?
    end
  end

  describe "delete country" do
    test "update country with success" do
      country = insert(:country)
      {:ok, result} = CountryActions.delete_country(country.id)
      assert result.id === country.id
      assert result.name  === country.name
    end

    test "update country with error" do
      assert_raise(Ecto.NoResultsError, (fn ->  CountryActions.delete_country(545) end))
    end
  end
end
