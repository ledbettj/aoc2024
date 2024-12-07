defmodule Day6Test do
  use ExUnit.Case
  doctest Day6

  test "part1 example" do
    input = "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#..."
    {start, grid} = Day6.parse_input(input)

    assert Day6.part1(start, grid) == 41
  end

  test "part 1 solution" do
    {:ok, input} = File.read("./test/input/day6")
    {start, grid} = Day6.parse_input(input)

    assert Day6.part1(start, grid) == 5095
  end
end
