defmodule Day7 do
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      [target | values] =
        line
        |> String.split(~r/[:\s]+/)
        |> Enum.map(&String.to_integer/1)

      {target, values}
    end)
  end

  def part1(inputs, operators \\ ["*", "+"]) do
    inputs
    |> Enum.filter(fn {target, values} ->
      [first | rest] = values
      equation_valid?(target, first, rest, operators)
    end)
    |> Enum.map(fn {target, _} -> target end)
    |> Enum.reduce(&Kernel.+/2)
  end

  def part2(inputs), do: part1(inputs, ["+", "*", "||"])

  def equation_valid?(target, current, [], _operators), do: current == target

  def equation_valid?(target, current, values, operators) do
    [next | rest] = values

    Enum.any?(operators, fn operator ->
      case operator do
        "*" -> equation_valid?(target, current * next, rest, operators)
        "+" -> equation_valid?(target, current + next, rest, operators)
        "||" -> equation_valid?(target, concat(current, next), rest, operators)
      end
    end)
  end

  def concat(a, b), do: String.to_integer("#{a}#{b}")
end
