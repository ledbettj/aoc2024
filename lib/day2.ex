defmodule Day2 do
  defmodule Report do
    defstruct levels: []

    @doc ~S"""

    ## Examples

      iex?> Report.parse("1 2 3 4 5")
      %Day2.Report{levels: [1, 2, 3, 4, 5]}

    """
    @spec parse(String.t()) :: %__MODULE__{}
    def parse(line) do
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> new()
    end

    @spec new([integer]) :: %__MODULE__{}
    def new(levels) do
      %__MODULE__{levels: levels}
    end

    @doc ~S"""

    ## Examples

    iex> Day2.Report.safe?(%Day2.Report{ levels: [7, 6, 4, 2, 1]})
    true

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 2, 7, 8, 9]})
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [9, 7, 6, 2, 1]})
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 3, 2, 4, 5]})
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [8, 6, 4, 4, 1]})
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 3, 6, 7, 9]})
    true
    """
    @spec safe?(%__MODULE__{}) :: boolean
    def safe?(%{levels: levels}) do
      levels
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce_while(%{asc: true, desc: true}, &check_level_pair/2)
      |> Map.values()
      |> Enum.any?(& &1)
    end

    def check_level_pair([a, b], %{asc: asc, desc: desc}) do
      v = abs(a - b)
      diff = v >= 1 && v <= 3
      result = %{asc: asc && a < b && diff, desc: desc && a > b && diff}

      if result.asc || result.desc do
        {:cont, result}
      else
        {:halt, result}
      end
    end

    @doc ~S"""

    ## Examples

    iex> Day2.Report.safe?(%Day2.Report{ levels: [7, 6, 4, 2, 1]}, :dampen)
    true

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 2, 7, 8, 9]}, :dampen)
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [9, 7, 6, 2, 1]}, :dampen)
    false

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 3, 2, 4, 5]}, :dampen)
    true

    iex> Day2.Report.safe?(%Day2.Report{ levels: [8, 6, 4, 4, 1]}, :dampen)
    true

    iex> Day2.Report.safe?(%Day2.Report{ levels: [1, 3, 6, 7, 9]}, :dampen)
    true
    """
    @spec safe?(%__MODULE__{}, :dampen) :: boolean
    def safe?(report, :dampen) do
      safe?(report) ||
        0..Enum.count(report.levels)
        |> Enum.map(fn index -> Report.new(List.delete_at(report.levels, index)) end)
        |> Enum.any?(&safe?/1)
    end
  end

  @spec parse_input(String.t()) :: [%__MODULE__.Report{}]
  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&Report.parse/1)
  end

  @spec part1([%__MODULE__.Report{}]) :: integer
  def part1(reports) do
    reports
    |> Enum.filter(&Report.safe?/1)
    |> Enum.count()
  end

  @spec part2([%__MODULE__.Report{}]) :: integer
  def part2(reports) do
    reports
    |> Enum.filter(&Report.safe?(&1, :dampen))
    |> Enum.count()
  end
end
