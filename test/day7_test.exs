defmodule Day7Test do
  use ExUnit.Case
  doctest Day7

  test "part 1 sample" do
    input = """
    190: 10 19
    3267: 81 40 27
    83: 17 5
    156: 15 6
    7290: 6 8 6 15
    161011: 16 10 13
    192: 17 8 14
    21037: 9 7 18 13
    292: 11 6 16 20
    """

    ans =
      Day7.parse_input(input)
      |> Day7.part1()

    assert ans == 3749
  end

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day7")

    ans =
      Day7.parse_input(text)
      |> Day7.part1()

    assert ans == 850_435_817_339
  end

  test "part 2 sample" do
    input = """
    190: 10 19
    3267: 81 40 27
    83: 17 5
    156: 15 6
    7290: 6 8 6 15
    161011: 16 10 13
    192: 17 8 14
    21037: 9 7 18 13
    292: 11 6 16 20
    """

    ans =
      Day7.parse_input(input)
      |> Day7.part2()

    assert ans == 11387
  end

  test "part2 solution" do
    {:ok, text} = File.read("./test/input/day7")

    ans =
      Day7.parse_input(text)
      |> Day7.part2()

    assert ans == 104_824_810_233_437
  end
end
