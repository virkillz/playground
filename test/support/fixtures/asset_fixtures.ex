defmodule Playground.AssetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Playground.Asset` context.
  """

  @doc """
  Generate a map.
  """
  def map_fixture(attrs \\ %{}) do
    {:ok, map} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        is_visible: true,
        name: "some name",
        size: 42
      })
      |> Playground.Asset.create_map()

    map
  end

  @doc """
  Generate a land.
  """
  def land_fixture(attrs \\ %{}) do
    {:ok, land} =
      attrs
      |> Enum.into(%{
        block: 42,
        description: "some description",
        eth_address: "some eth_address",
        image: "some image",
        index: 42,
        map_address: "some map_address",
        name: "some name",
        pos_x: 42,
        pos_y: 42,
        rent_price: 120.5,
        roi: 120.5,
        sell_price: 120.5,
        type: "some type"
      })
      |> Playground.Asset.create_land()

    land
  end
end
