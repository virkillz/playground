defmodule Playground.Util do
  def block_number_to_pos(block_number) do
    x = div(block_number + 9, 10)
    rem = rem(block_number, 10)
    y = if rem == 0, do: 10, else: rem

    {x, y}
  end

  def get_legal_moves({nil, nil}, nil), do: []

  def get_legal_moves({pos_x, pos_y}, move_range) do
    minus = -1 * move_range
    range = minus..move_range

    x_range =
      Enum.map(range, fn x ->
        pos_x + x
      end)

    y_range =
      Enum.map(range, fn x ->
        pos_y + x
      end)

    legal_moves = for x <- x_range, y <- y_range, do: {x, y}

    legal_moves
    |> Enum.filter(fn {x, y} -> x > 0 and y > 0 end)
    |> Enum.filter(fn {x, y} -> x < 11 and y < 11 end)
  end

  @spec get_legal_moves({any, any}, nil | integer, any) :: list
  def get_legal_moves({nil, nil}, nil, _board), do: []

  def get_legal_moves({pos_x, pos_y}, move_range, board) do
    occupied_block = board.positions |> Enum.map(fn x -> {x.pos_x, x.pos_y} end)

    Playground.Util.get_legal_moves({pos_x, pos_y}, move_range)
    |> Enum.filter(fn x -> not Enum.member?(occupied_block, x) end)
    |> List.insert_at(0, {pos_x, pos_y})
  end
end
