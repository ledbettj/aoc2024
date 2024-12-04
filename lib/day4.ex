defmodule Day4 do
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> Stream.with_index()
    |> Enum.reduce(%{}, fn {chars, y}, grid ->
      chars
      |> Stream.with_index()
      |> Enum.reduce(grid, fn {char, x}, grid ->
        Map.put(grid, {x, y}, char)
      end)
    end)
  end

  def part1(grid) do
    grid
    |> Enum.filter_map(fn
      {pos, "X"} -> adjacent(grid, "M", pos)
      _ -> nil
    end)
    |> Enum.flat_map(fn pos -> adjacent(grid, "A", pos) end)
    |> Enum.flat_map(fn pos -> adjacent(grid, "S", pos) end)
    |> Enum.reduce(&Kernel.+/2)
  end

  def adjacent(grid, target, {x, y}) do
    Enum.map(-1..1, fn x_off ->
      Enum.map(-1..1, fn y_off ->
        pos = {x + x_off, y + y_off}

        if {x_off, y_off} != {0, 0} && Map.get(grid, pos) == target do
          pos
        else
          nil
        end
      end)
    end)
  end
end
