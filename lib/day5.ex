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

  def in_order(page_list, rules) do
    page_list
    |> Stream.with_index()
    |> Enum.all?(fn {page, index} ->
      dependencies = Map.get(rules, page, [])

      Enum.all?(dependencies, fn dependency ->
        i = Enum.find_index(page_list, fn d -> d == dependency end)
        is_nil(i) || i < index
      end)
    end)
  end

  def part1(rules, page_numbers_list) do
    page_numbers_list
    |> Enum.filter(&in_order(&1, rules))
    |> Enum.map(fn pages ->
      size = Enum.count(pages)
      Enum.at(pages, div(size, 2))
    end)
    |> Enum.reduce(&Kernel.+/2)
  end

  def part2(rules, page_numbers_list) do
    page_numbers_list
    |> Enum.reject(&in_order(&1, rules))
    |> Enum.map(fn pages -> reorder(pages, rules) end)
    |> Enum.map(fn pages ->
      size = Enum.count(pages)
      Enum.at(pages, div(size, 2))
    end)
    |> Enum.reduce(&Kernel.+/2)
  end

  def reorder(pages, rules) do
  end
end
