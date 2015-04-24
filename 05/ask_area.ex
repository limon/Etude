defmodule Geom do
  @moduledoc """
  Functions for calculating areas for geometric shapes.
  """
  @vsn 0.1

  def area(shape, param1, param2) when param1 >= 0 and param2 >= 0  do
    case shape do
      :rectangle -> param1 * param2
      :triangle -> param1 * param2 / 2
      :ellipse -> :math.pi() * param1 * param2
    end
  end
end

defmodule AskArea do
  def area do
    try do
      shape = case input_shape do
        { x, :unknown} -> throw { :invalid_shape, x }
        { _, shape } -> shape
      end
      [ param1, param2 ] = input_params(shape)
      IO.puts Geom.area(shape, param1, param2)
    catch
      { :invalid_shape, x } -> IO.puts "Unknown shape #{x}"
      :invalid_params -> IO.puts "Both params must be numbers and greater than or equal to zero."
    end
  end

  defp input_shape do
    case IO.gets("R)ectangle, T)riangle, or E)llipse: ") |> String.first |> String.upcase do
      "R" -> {"R", :rectangle}
      "T" -> {"T", :triangle}
      "E" -> {"E", :ellipse}
      x -> {x, :unknown}
    end
  end

  defp input_params(shape) do
    case shape do
      :rectangle -> [ "width", "height" ]
      :triangle -> [ "base", "height" ]
      :ellipse -> [ "major radius", "minor radius" ]
    end
    |> prompt_with_param_names
    |> Enum.map(&binary_to_number(&1))
  end

  defp prompt_with_param_names(param_names) do
    for name <- param_names do
      IO.gets("Enter #{name} > ") |> String.strip
    end
  end

  defp binary_to_number(bin) do
    cond do
      Regex.match?(~r/^([1-9][0-9]*|0)$/, bin) ->
        String.to_integer bin
      Regex.match?(~r/^([1-9][0-9]+|[0-9])\.[0-9]+$/, bin) ->
        String.to_float bin
      true ->
        throw :invalid_params
    end
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case
end
