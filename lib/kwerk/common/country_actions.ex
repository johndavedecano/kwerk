defmodule Kwerk.Common.CountryActions do

  alias Kwerk.Common.Country
  alias Kwerk.Repo

  @doc """
    Find Country by id but raises Ecto.NoResultsError if no record was found
  """
  def find_by_id!(id) do
    Repo.get!(Country, id)
  end

  @doc """
    Find Country by id but raises no error if no record was found
  """
  def find_by_id(id) do
    Repo.get(Country, id)
  end

  @doc """
    Inserts a Country defined on the changeset
  """
  def create_country(country_params) do
    changeset = Country.changeset(%Country{}, country_params)
    changeset |> Repo.insert
  end

  @doc """
    Updates a Country defined on the changeset
  """
  def update_country(country, country_params) do
    changeset = Country.changeset(country, country_params)
    changeset |> Repo.update
  end

  @doc """
    Deletes a Country but sets its status to `Constants.cSTATUS_DELETED`
  """
  def delete_country(id) do
    country = find_by_id!(id)
    country |> Repo.delete
  end
end
