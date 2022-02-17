defmodule Playground.AssetTest do
  use Playground.DataCase

  alias Playground.Asset

  describe "maps" do
    alias Playground.Asset.Map

    import Playground.AssetFixtures

    @invalid_attrs %{description: nil, image: nil, is_visible: nil, name: nil, size: nil}

    test "list_maps/0 returns all maps" do
      map = map_fixture()
      assert Asset.list_maps() == [map]
    end

    test "get_map!/1 returns the map with given id" do
      map = map_fixture()
      assert Asset.get_map!(map.id) == map
    end

    test "create_map/1 with valid data creates a map" do
      valid_attrs = %{description: "some description", image: "some image", is_visible: true, name: "some name", size: 42}

      assert {:ok, %Map{} = map} = Asset.create_map(valid_attrs)
      assert map.description == "some description"
      assert map.image == "some image"
      assert map.is_visible == true
      assert map.name == "some name"
      assert map.size == 42
    end

    test "create_map/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Asset.create_map(@invalid_attrs)
    end

    test "update_map/2 with valid data updates the map" do
      map = map_fixture()
      update_attrs = %{description: "some updated description", image: "some updated image", is_visible: false, name: "some updated name", size: 43}

      assert {:ok, %Map{} = map} = Asset.update_map(map, update_attrs)
      assert map.description == "some updated description"
      assert map.image == "some updated image"
      assert map.is_visible == false
      assert map.name == "some updated name"
      assert map.size == 43
    end

    test "update_map/2 with invalid data returns error changeset" do
      map = map_fixture()
      assert {:error, %Ecto.Changeset{}} = Asset.update_map(map, @invalid_attrs)
      assert map == Asset.get_map!(map.id)
    end

    test "delete_map/1 deletes the map" do
      map = map_fixture()
      assert {:ok, %Map{}} = Asset.delete_map(map)
      assert_raise Ecto.NoResultsError, fn -> Asset.get_map!(map.id) end
    end

    test "change_map/1 returns a map changeset" do
      map = map_fixture()
      assert %Ecto.Changeset{} = Asset.change_map(map)
    end
  end

  describe "lands" do
    alias Playground.Asset.Land

    import Playground.AssetFixtures

    @invalid_attrs %{block: nil, description: nil, eth_address: nil, image: nil, index: nil, map_address: nil, name: nil, pos_x: nil, pos_y: nil, rent_price: nil, roi: nil, sell_price: nil, type: nil}

    test "list_lands/0 returns all lands" do
      land = land_fixture()
      assert Asset.list_lands() == [land]
    end

    test "get_land!/1 returns the land with given id" do
      land = land_fixture()
      assert Asset.get_land!(land.id) == land
    end

    test "create_land/1 with valid data creates a land" do
      valid_attrs = %{block: 42, description: "some description", eth_address: "some eth_address", image: "some image", index: 42, map_address: "some map_address", name: "some name", pos_x: 42, pos_y: 42, rent_price: 120.5, roi: 120.5, sell_price: 120.5, type: "some type"}

      assert {:ok, %Land{} = land} = Asset.create_land(valid_attrs)
      assert land.block == 42
      assert land.description == "some description"
      assert land.eth_address == "some eth_address"
      assert land.image == "some image"
      assert land.index == 42
      assert land.map_address == "some map_address"
      assert land.name == "some name"
      assert land.pos_x == 42
      assert land.pos_y == 42
      assert land.rent_price == 120.5
      assert land.roi == 120.5
      assert land.sell_price == 120.5
      assert land.type == "some type"
    end

    test "create_land/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Asset.create_land(@invalid_attrs)
    end

    test "update_land/2 with valid data updates the land" do
      land = land_fixture()
      update_attrs = %{block: 43, description: "some updated description", eth_address: "some updated eth_address", image: "some updated image", index: 43, map_address: "some updated map_address", name: "some updated name", pos_x: 43, pos_y: 43, rent_price: 456.7, roi: 456.7, sell_price: 456.7, type: "some updated type"}

      assert {:ok, %Land{} = land} = Asset.update_land(land, update_attrs)
      assert land.block == 43
      assert land.description == "some updated description"
      assert land.eth_address == "some updated eth_address"
      assert land.image == "some updated image"
      assert land.index == 43
      assert land.map_address == "some updated map_address"
      assert land.name == "some updated name"
      assert land.pos_x == 43
      assert land.pos_y == 43
      assert land.rent_price == 456.7
      assert land.roi == 456.7
      assert land.sell_price == 456.7
      assert land.type == "some updated type"
    end

    test "update_land/2 with invalid data returns error changeset" do
      land = land_fixture()
      assert {:error, %Ecto.Changeset{}} = Asset.update_land(land, @invalid_attrs)
      assert land == Asset.get_land!(land.id)
    end

    test "delete_land/1 deletes the land" do
      land = land_fixture()
      assert {:ok, %Land{}} = Asset.delete_land(land)
      assert_raise Ecto.NoResultsError, fn -> Asset.get_land!(land.id) end
    end

    test "change_land/1 returns a land changeset" do
      land = land_fixture()
      assert %Ecto.Changeset{} = Asset.change_land(land)
    end
  end
end
