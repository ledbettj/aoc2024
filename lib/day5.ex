defmodule Day5 do
  @spec parse_input(binary()) :: list()
  def parse_input(input) do
    [rules, page_numbers] =
      input
      |> String.trim()
      |> String.split("\n\n", parts: 2, trim: true)

    rules =
      rules
      |> String.split("\n")
      |> Enum.map(fn line ->
        [a, b] =
          line
          |> String.split("|")
          |> Enum.map(&String.to_integer/1)

        {a, b}
      end)
      |> Enum.reduce(%{}, fn {a, b}, acc ->
        Map.update(acc, b, [a], fn existing ->
          [a | existing]
        end)
      end)

    page_numbers =
      page_numbers
      |> String.split("\n")
      |> Enum.map(fn line ->
        line
        |> String.split(",")
        |> Enum.map(&String.to_integer/1)
      end)

    {rules, page_numbers}
  end

  def part1({rules, page_numbers}) do
  end
end
