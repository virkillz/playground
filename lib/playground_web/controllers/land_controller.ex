defmodule PlaygroundWeb.LandController do
  use PlaygroundWeb, :controller
  # plug :put_layout, "milligram.html"

  alias Playground.Asset
  alias Playground.Asset.Land

  def index(conn, _params) do
    lands = Asset.list_lands()

    render(conn, "index.html", lands: lands)
  end

  def new(conn, _params) do
    changeset = Asset.change_land(%Land{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"land" => land_params}) do
    case Asset.create_land(land_params) do
      {:ok, land} ->
        conn
        |> put_flash(:info, "Land created successfully.")
        |> redirect(to: Routes.land_path(conn, :show, land))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    land = Asset.get_land!(id)
    render(conn, "show.html", land: land)
  end

  def edit(conn, %{"id" => id}) do
    land = Asset.get_land!(id)
    changeset = Asset.change_land(land)
    render(conn, "edit.html", land: land, changeset: changeset)
  end

  def update(conn, %{"id" => id, "land" => land_params}) do
    land = Asset.get_land!(id)

    case Asset.update_land(land, land_params) do
      {:ok, land} ->
        conn
        |> put_flash(:info, "Land updated successfully.")
        |> redirect(to: Routes.land_path(conn, :show, land))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", land: land, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    land = Asset.get_land!(id)
    {:ok, _land} = Asset.delete_land(land)

    conn
    |> put_flash(:info, "Land deleted successfully.")
    |> redirect(to: Routes.land_path(conn, :index))
  end
end
