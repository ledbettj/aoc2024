defmodule Day2Test do
  use ExUnit.Case, async: true
  doctest Day2
  doctest Day2.Report, import: true

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day2")
    reports = Day2.parse_input(text)

    assert Day2.part1(reports) == 432
  end

  test "part2 solution" do
    {:ok, text} = File.read("./test/input/day2")
    reports = Day2.parse_input(text)

    assert Day2.part2(reports) == 488
  end
end
