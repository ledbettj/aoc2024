defmodule Day6 do
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> Stream.with_index()
    |> Enum.reduce({nil, %{}}, fn {chars, y}, {start_pos, grid} ->
      chars
      |> Stream.with_index()
      |> Enum.reduce({start_pos, grid}, fn
        {"^", x}, {_, grid} -> {{x, y}, Map.put(grid, {x, y}, "X")}
        {char, x}, {start, grid} -> {start, Map.put(grid, {x, y}, char)}
      end)
    end)
  end

  def part1(start, grid) do
    dir = {0, -1}
    pos = start

    res = p1_iterate(pos, dir, grid)

    print(res)

    res
    |> Map.values()
    |> Enum.count(&(&1 == "X"))
  end

  def print(grid) do
    {min_x, max_x} =
      grid
      |> Map.keys()
      |> Enum.reduce({0, 0}, fn {x, _}, {min, max} -> {min(x, min), max(x, max)} end)

    {min_y, max_y} =
      grid
      |> Map.keys()
      |> Enum.reduce({0, 0}, fn {_, y}, {min, max} -> {min(y, min), max(y, max)} end)

    for y <- min_y..max_y do
      for x <- min_x..max_x do
        IO.write(Map.get(grid, {x, y}, "."))
      end

      IO.puts("")
    end
  end

  def right_turn({px, py}, {dx, dy}) do
    case {dx, dy} do
      {0, -1} -> {{px + 1, py}, {1, 0}}
      {1, 0} -> {{px, py + 1}, {0, 1}}
      {0, 1} -> {{px - 1, py}, {-1, 0}}
      {-1, 0} -> {{px, py - 1}, {0, -1}}
    end
  end

  def p1_iterate(pos = {px, py}, dir = {dx, dy}, grid) do
    next = {px + dx, py + dy}

    case Map.get(grid, next) do
      "X" ->
        p1_iterate(next, dir, grid)

      "." ->
        p1_iterate(next, dir, Map.put(grid, next, "X"))

      "#" ->
        {next, dir} = right_turn(pos, dir)
        p1_iterate(next, dir, Map.put(grid, next, "X"))

      _ ->
        grid
    end
  end
end
