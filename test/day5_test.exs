defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  test "part 1 sample" do
    input = """
    47|53
    97|13
    97|61
    97|47
    75|29
    61|13
    75|53
    29|13
    97|29
    53|29
    61|53
    97|53
    61|29
    47|13
    75|47
    97|75
    47|61
    75|61
    47|29
    75|13
    53|13

    75,47,61,53,29
    97,61,53,29,13
    75,29,13
    75,97,47,61,53
    61,13,29
    97,13,75,29,47
    """

    {rules, page_list} = Day5.parse_input(input)
    assert Day5.part1(rules, page_list) == 143
  end

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day5")

    {rules, page_list} = Day5.parse_input(text)
    assert Day5.part1(rules, page_list) == 7024
  end

  # test "part 2 sample" do
  #   ans =
  #     "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"
  #     |> Day5.parse_input()
  #     |> Day5.part2()

  #   assert ans == 9
  # end
end
