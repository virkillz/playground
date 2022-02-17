defmodule PlaygroundWeb.LandControllerTest do
  use PlaygroundWeb.ConnCase

  import Playground.AssetFixtures

  @create_attrs %{block: 42, description: "some description", eth_address: "some eth_address", image: "some image", index: 42, map_address: "some map_address", name: "some name", pos_x: 42, pos_y: 42, rent_price: 120.5, roi: 120.5, sell_price: 120.5, type: "some type"}
  @update_attrs %{block: 43, description: "some updated description", eth_address: "some updated eth_address", image: "some updated image", index: 43, map_address: "some updated map_address", name: "some updated name", pos_x: 43, pos_y: 43, rent_price: 456.7, roi: 456.7, sell_price: 456.7, type: "some updated type"}
  @invalid_attrs %{block: nil, description: nil, eth_address: nil, image: nil, index: nil, map_address: nil, name: nil, pos_x: nil, pos_y: nil, rent_price: nil, roi: nil, sell_price: nil, type: nil}

  describe "index" do
    test "lists all lands", %{conn: conn} do
      conn = get(conn, Routes.land_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lands"
    end
  end

  describe "new land" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.land_path(conn, :new))
      assert html_response(conn, 200) =~ "New Land"
    end
  end

  describe "create land" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.land_path(conn, :create), land: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.land_path(conn, :show, id)

      conn = get(conn, Routes.land_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Land"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.land_path(conn, :create), land: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Land"
    end
  end

  describe "edit land" do
    setup [:create_land]

    test "renders form for editing chosen land", %{conn: conn, land: land} do
      conn = get(conn, Routes.land_path(conn, :edit, land))
      assert html_response(conn, 200) =~ "Edit Land"
    end
  end

  describe "update land" do
    setup [:create_land]

    test "redirects when data is valid", %{conn: conn, land: land} do
      conn = put(conn, Routes.land_path(conn, :update, land), land: @update_attrs)
      assert redirected_to(conn) == Routes.land_path(conn, :show, land)

      conn = get(conn, Routes.land_path(conn, :show, land))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, land: land} do
      conn = put(conn, Routes.land_path(conn, :update, land), land: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Land"
    end
  end

  describe "delete land" do
    setup [:create_land]

    test "deletes chosen land", %{conn: conn, land: land} do
      conn = delete(conn, Routes.land_path(conn, :delete, land))
      assert redirected_to(conn) == Routes.land_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.land_path(conn, :show, land))
      end
    end
  end

  defp create_land(_) do
    land = land_fixture()
    %{land: land}
  end
end
