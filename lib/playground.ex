defmodule Playground do
  @moduledoc """
  Playground keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # Playground.get_legal_moves({2,2}, 1)
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
    |> Enum.filter(fn {x, y} -> x < 9 and y < 9 end)
  end
end
