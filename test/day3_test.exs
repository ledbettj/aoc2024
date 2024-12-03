defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day3")
    assert Day3.eval(text) == 168_539_636
  end

  test "part2 solution" do
    {:ok, text} = File.read("./test/input/day3")

    assert Day3.eval(text, :repair) == 97_529_391
  end
end
