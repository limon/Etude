defmodule Powers do
  import Kernel, except: [raise: 2]
  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n < 0, do: 1 / raise(x, -n)
  def raise(x, n) do
    x * raise(x, n - 1)
  end
end

ExUnit.start

defmodule PowersTest do
  use ExUnit.Case

  test "Compute x^n" do
    assert Powers.raise(5, 1) == 5
    assert Powers.raise(2, 3) == 8
    assert Powers.raise(1.2, 3) == 1.728
    assert Powers.raise(2, 0) == 1
    assert Powers.raise(2, -3) == 0.125
  end
end
