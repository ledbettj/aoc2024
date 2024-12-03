defmodule Day3 do
  @doc ~S"""

  ## Example

      iex> Day3.eval("xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")
      161
  """
  def eval(code) do
    ~r/mul\((\d+),(\d+)\)/
    |> Regex.scan(code)
    |> Enum.reduce(0, fn [_, a, b], acc -> acc + String.to_integer(a) * String.to_integer(b) end)
  end

  @doc ~S"""
    ## Example

      iex> Day3.eval("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))", :repair)
      48
  """
  def eval(code, :repair) do
    ~r/mul\((\d+),(\d+)\)|do\(\)|don't\(\)/
    |> Regex.scan(code)
    |> Enum.reduce({true, 0}, fn
      ["do()"], {_, accum} -> {true, accum}
      ["don't()"], {_, accum} -> {false, accum}
      [_, a, b], {true, accum} -> {true, accum + String.to_integer(a) * String.to_integer(b)}
      _, {false, accum} -> {false, accum}
    end)
    |> elem(1)
  end
end
