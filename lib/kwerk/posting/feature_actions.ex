defmodule Kwerk.Posting.FeatureActions do

  alias Kwerk.Posting.Feature
  alias Kwerk.Repo
  alias Kwerk.Constants

  @doc """
    Find Feature by id but raises Ecto.NoResultsError if no record was found
  """
  def find_by_id!(id) do
    Repo.get!(Feature, id)
  end

  @doc """
    Find Feature by id but raises no error if no record was found
  """
  def find_by_id(id) do
    Repo.get(Feature, id)
  end

  @doc """
    Inserts a Feature defined on the changeset
  """
  def create_feature(feature_params) do
    changeset = Feature.changeset(%Feature{}, feature_params)
    changeset |> Repo.insert
  end

  @doc """
    Updates a Feature defined on the changeset
  """
  def update_feature(feature, feature_params) do
    changeset = Feature.changeset(feature, feature_params)
    changeset |> Repo.update
  end

  @doc """
    Deletes a Feature but sets its status to `Constants.cSTATUS_DELETED`
  """
  def delete_feature(id) do
    feature = find_by_id!(id)
    changeset = Feature.changeset(feature, %{status: Constants.cSTATUS_DELETED})
    changeset |> Repo.update
  end
end
