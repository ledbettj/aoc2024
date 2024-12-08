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
    |> Enum.flat_map(fn
      {pos, "X"} -> adjacent(grid, ["M", "A", "S"], pos)
      _ -> []
    end)
    |> Enum.count()
  end

  def adjacent(grid, targets, {x, y}, {dx, dy}) do
    [target | targets] = targets

    pos = {x + dx, y + dy}

    if Map.get(grid, pos) == target do
      if Enum.empty?(targets) do
        [1]
      else
        adjacent(grid, targets, pos, {dx, dy})
      end
    else
      []
    end
  end

  def adjacent(grid, targets, {x, y}) do
    [target | targets] = targets

    Enum.flat_map(-1..1, fn x_off ->
      Enum.flat_map(-1..1, fn y_off ->
        pos = {x + x_off, y + y_off}

        if {x_off, y_off} != {0, 0} && Map.get(grid, pos) == target do
          adjacent(grid, targets, pos, {x_off, y_off})
        else
          []
        end
      end)
    end)
  end
end
