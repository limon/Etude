defmodule Geom do
  @moduledoc """
  Functions for calculating areas for geometric shapes.
  """
  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of them.
  The default value for both is 1.
  """
  def area(length \\ 1, width \\ 1), do: length * width
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case

  test "compute area by length and width" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
    assert Geom.area(7, 5) == 35
  end

  test "compute area by length and default width" do
    assert Geom.area(7) == 7
  end

  test "compute area by default length and default width" do
    assert Geom.area() == 1
  end
end
