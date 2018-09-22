defmodule Kwerk.Posting.FeatureActionsTest do
  use Kwerk.DataCase

  alias Kwerk.Posting.FeatureActions

  import Kwerk.Factory

  describe "create feature" do
    test "create feature with validation error" do
      {:error, changeset} = FeatureActions.create_feature(%{})
      refute changeset.valid?
    end

    test "create feature with success" do
      {:ok, feature} = FeatureActions.create_feature(%{name: "Office", status: "active"})
      assert feature.name === "Office"
      assert feature.status === "active"
    end
  end

  describe "update feature" do
    test "update feature with success" do
      feature = insert(:feature)
      {:ok, result} = FeatureActions.update_feature(feature, %{name: "Test", status: "active"})
      assert result.name === "Test"
      assert result.status === "active"
    end

    test "update feature with validation error" do
      feature = insert(:feature)
      {:error, changeset} = FeatureActions.update_feature(feature, %{name: ""})
      refute changeset.valid?
    end

    test "update feature with validate error invalid status" do
      feature = insert(:feature)
      {:error, changeset} = FeatureActions.update_feature(feature, %{name: "Test", status: "test"})
      refute changeset.valid?
    end
  end

  describe "delete feature" do
    test "update feature with success" do
      feature = insert(:feature)
      {:ok, result} = FeatureActions.delete_feature(feature.id)
      assert result.status === "deleted"
    end

    test "update feature with error" do
      assert_raise(Ecto.NoResultsError, (fn ->  FeatureActions.delete_feature(545) end))
    end
  end
end
