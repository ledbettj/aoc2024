defmodule Day1 do
  @doc ~S"""
  Given a string containing a list of pairs of integers separated by whitespace,
  parse the string into two lists of integers.

  ## Examples

        iex> Day1.parse_input("1  2\n3  4\n")
        {[3, 1], [4, 2]}
  """
  @spec parse_input(String.t()) :: {list(integer), list(integer)}
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce({[], []}, fn line, {left_list, right_list} ->
      parts =
        line
        |> String.split(~r{\s+}, trim: true, parts: 2)
        |> Enum.map(&String.to_integer/1)

      [left, right] = parts
      {[left | left_list], [right | right_list]}
    end)
  end

  @doc ~S"""
  Given two lists of integers, calculate the sum of the absolute differences between sorted pairs.

  ## Examples

        iex> Day1.part1([3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3])
        11
  """
  @spec part1(list(integer), list(integer)) :: integer
  def part1(left_list, right_list) do
    left_list = Enum.sort(left_list, :asc)
    right_list = Enum.sort(right_list, :asc)

    Enum.zip(left_list, right_list)
    |> Enum.reduce(0, fn {left, right}, acc ->
      acc + abs(right - left)
    end)
  end

  @doc ~S"""
  For two lists of integers, multiply each integer in the first list by the number of times it appears
  in the second list, and then sum them.

  ## Examples

        iex> Day1.part2([3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3])
        31
  """
  @spec part2(list(integer), list(integer)) :: integer
  def part2(left_list, right_list) do
    right = Enum.frequencies(right_list)

    Enum.reduce(left_list, 0, fn v, acc ->
      acc + v * Map.get(right, v, 0)
    end)
  end
end
