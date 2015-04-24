defmodule Powers do
  import Kernel, except: [raise: 2]
  def raise(x, n), do: do_raise(x, n, 1)
  def do_raise(_, 0, acc), do: acc
  def do_raise(x, n, acc) when n < 0, do: 1 / do_raise(x, -n, acc)
  def do_raise(x, n, acc) do
    do_raise(x, n - 1, acc * x)
  end

  def nth_root(x, n), do: do_nth_root(x, n, x / 2)
  def do_nth_root(x, n, a) do
    next = a - (raise(a, n) - x) / (n * raise(a, (n - 1)))
    case (next - a) do
      delta when abs(delta) < 1.0e-8 -> next
      _ -> do_nth_root(x, n, next)
    end
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

  test "compute nth_root" do
    assert Powers.nth_root(27, 3) == 3.0
    assert Powers.nth_root(2, 2) == 1.4142135623730951
  end
end
