defmodule Day4Test do
  use ExUnit.Case, async: true
  doctest Day4

  test "part 1 sample" do
    ans =
      "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"
      |> Day4.parse_input()
      |> Day4.part1()

    assert ans == 18
  end

  test "part1 solution" do
    {:ok, text} = File.read("./test/input/day4")

    ans =
      text
      |> Day4.parse_input()
      |> Day4.part1()

    assert ans == 2560
  end

  # test "part 2 sample" do
  #   ans =
  #     "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"
  #     |> Day4.parse_input()
  #     |> Day4.part2()

  #   assert ans == 9
  # end
  end
