defmodule Playground.Land do

  @moduledoc """

  land

  maps
  - id
  - name
  - description
  - is_visible
  - size
  -

  map_detail
  -id
  -map_id
  -block
  -index
  -type
  -image
  -pos_x
  -pos_y
  -user_id
  -address
  -description
  -name
  -purchase_price
  -rent_price
  -roi



  """


  def generate(start_index \\ 0 ) do
    size = 100

    area = size * size

    blocks = 1..area

    {blocks |> Enum.shuffle(), []}
    |> assign_block(2, "farm")
    |> assign_block(2, "mine")
    |> assign_block(2, "alchemy")
    |> assign_block(2, "armory")
    |> assign_block(2, "market")
    |> assign_block(2, "mercenary_market")
    |> assign_block(1, "arena")
    |> assign_block(1000, "house")
    |> assign_block(2000, "tree")
    |> assign_block(1500, "rock")
    |> assign_remaining()
    |> Enum.sort(&(&1.block < &2.block))
    |> Enum.map(fn block ->

        x = div(block.block + (size - 1), size)
        rem = rem(block.block, size)
        y = if rem == 0, do: size, else: rem

      Map.merge(block, %{pos_x: x, pos_y: y})

      end)
    |> assign_house_index(start_index)
  end

  def generate_and_record(map_id, start_index) do
    generate(start_index)
    |> Enum.map(fn x ->

      x
      |> Map.put(:map_id, map_id)
      |> Playground.Asset.create_land()

    end)
  end




  # Playground.Land.get_distance({2,2},{2,4})
  def get_distance({from_x, from_y}, {to_x, to_y}) do
    :math.sqrt(:math.pow((to_x - from_x), 2) + :math.pow((to_y - from_y), 2))
  end

  def assign_house_index(list, start_index \\ 0) do
    assign_house_index(list, start_index, [])
  end

  def assign_house_index([], _last_index, acc), do: acc
  def assign_house_index([h | t], last_index, acc) do

    {processed, new_last_index} =
      if h.type == "house" do
        {Map.put(h, :index, last_index + 1), last_index + 1}
      else
        {Map.put(h, :index, nil), last_index}
      end

    assign_house_index(t, new_last_index, [processed | acc])
  end

  def assign_block( {remaining, accumulation}, number, type) do

    {split, new_remaining} = Enum.split(remaining, number)

    new_list =
      split
      |> Enum.map(fn x ->

        %{
          block: x,
          type: type
        }

      end)

    {new_remaining, [ new_list | accumulation] |> List.flatten}

  end

  def assign_remaining({remaining, accumulation}) do
    rem =
      remaining
      |> Enum.map(fn x ->

        %{
          block: x,
          type: nil
        }

      end)

    rem ++ accumulation
  end
end
