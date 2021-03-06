defmodule Playground.Asset do
  @moduledoc """
  The Asset context.
  """

  import Ecto.Query, warn: false
  alias Playground.Repo

  alias Playground.Asset.Map

  @doc """
  Returns the list of maps.

  ## Examples

      iex> list_maps()
      [%Map{}, ...]

  """
  def list_maps do
    Repo.all(Map)
  end

  @doc """
  Gets a single map.

  Raises `Ecto.NoResultsError` if the Map does not exist.

  ## Examples

      iex> get_map!(123)
      %Map{}

      iex> get_map!(456)
      ** (Ecto.NoResultsError)

  """
  def get_map!(id), do: Repo.get!(Map, id)

  @doc """
  Creates a map.

  ## Examples

      iex> create_map(%{field: value})
      {:ok, %Map{}}

      iex> create_map(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_map(attrs \\ %{}) do
    %Map{}
    |> Map.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a map.

  ## Examples

      iex> update_map(map, %{field: new_value})
      {:ok, %Map{}}

      iex> update_map(map, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_map(%Map{} = map, attrs) do
    map
    |> Map.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a map.

  ## Examples

      iex> delete_map(map)
      {:ok, %Map{}}

      iex> delete_map(map)
      {:error, %Ecto.Changeset{}}

  """
  def delete_map(%Map{} = map) do
    Repo.delete(map)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking map changes.

  ## Examples

      iex> change_map(map)
      %Ecto.Changeset{data: %Map{}}

  """
  def change_map(%Map{} = map, attrs \\ %{}) do
    Map.changeset(map, attrs)
  end

  alias Playground.Asset.Land

  @doc """
  Returns the list of lands.

  ## Examples

      iex> list_lands()
      [%Land{}, ...]

  """
  def list_lands do
    Repo.all(Land)
  end

  @doc """
  Gets a single land.

  Raises `Ecto.NoResultsError` if the Land does not exist.

  ## Examples

      iex> get_land!(123)
      %Land{}

      iex> get_land!(456)
      ** (Ecto.NoResultsError)

  """
  def get_land!(id), do: Repo.get!(Land, id)

  @doc """
  Creates a land.

  ## Examples

      iex> create_land(%{field: value})
      {:ok, %Land{}}

      iex> create_land(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_land(attrs \\ %{}) do
    %Land{}
    |> Land.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a land.

  ## Examples

      iex> update_land(land, %{field: new_value})
      {:ok, %Land{}}

      iex> update_land(land, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_land(%Land{} = land, attrs) do
    land
    |> Land.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a land.

  ## Examples

      iex> delete_land(land)
      {:ok, %Land{}}

      iex> delete_land(land)
      {:error, %Ecto.Changeset{}}

  """
  def delete_land(%Land{} = land) do
    Repo.delete(land)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking land changes.

  ## Examples

      iex> change_land(land)
      %Ecto.Changeset{data: %Land{}}

  """
  def change_land(%Land{} = land, attrs \\ %{}) do
    Land.changeset(land, attrs)
  end
end
