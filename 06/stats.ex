defmodule Stats do
  def minimum([]), do: nil
  def minimum([head | tail]), do: do_minimum(tail, head)

  defp do_minimum([], min), do: min
  defp do_minimum([head | tail], min) when head < min, do: do_minimum(tail, head)
  defp do_minimum([_ | tail], min), do: do_minimum(tail, min)

  def maximum([]), do: nil
  def maximum([head | tail]), do: do_maximum(tail, head)

  defp do_maximum([], max), do: max
  defp do_maximum([head | tail], max) when head > max, do: do_maximum(tail, head)
  defp do_maximum([_ | tail], max), do: do_maximum(tail, max)

  def range([]), do: [nil, nil]
  def range([head | tail]), do: do_range(tail, [head, head])

  defp do_range([], acc), do: acc
  defp do_range([head | tail], [min, max]) do
    if head < min, do: min = head
    if head > max, do: max = head
    do_range(tail, [min, max])
  end
end

ExUnit.start

defmodule StatsTest do
  use ExUnit.Case

  setup do
    data = [4, 1, 7, -17, 8, 2, 5]
    {:ok, data: data}
  end

  test "get minimum from a list of numbers", %{data: data} do
    assert Stats.minimum(data) == -17
  end

  test "get minimum from a empty list returns nil" do
    assert Stats.minimum([]) == nil
  end

  test "get maximum from a list of numbers", %{data: data} do
    assert Stats.maximum(data) == 8
  end

  test "get maximum from a empty list returns nil" do
    assert Stats.maximum([]) == nil
  end

  test "get [min, max] from a list of numbers", %{data: data} do
    assert Stats.range(data) == [-17, 8]
  end

  test "get [min, max] from a empty list returns [nil, nil]" do
    assert Stats.range([]) == [nil, nil]
  end

end
