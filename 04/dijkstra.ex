defmodule Dijkstra do
  def gcd(a, b) when rem(a, b) == 0, do: b
  def gcd(a, b), do: gcd(b, rem(a, b))
end

ExUnit.start

defmodule DijkstraTest do
  use ExUnit.Case

  test "compute gcd of two numbers" do
    assert Dijkstra.gcd(2, 8) == 2
    assert Dijkstra.gcd(14, 21) == 7
    assert Dijkstra.gcd(125, 46) == 1
    assert Dijkstra.gcd(120, 36) == 12
  end
end
