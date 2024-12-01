defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day1")
    {left, right} = Day1.parse_input(text)

    assert Day1.part1(left, right) == 1_506_483
  end

  test "part2 solution" do
    {:ok, text} = File.read("./test/input/day1")
    {left, right} = Day1.parse_input(text)

    assert Day1.part2(left, right) == 23_126_924
  end
end
