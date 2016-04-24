defmodule Elmxir do
  @moduledoc """
  Helper methods for a better life with Elm + Elixir
  """

  @doc """
  Get the arguments from an Elm object

  Returned in a mixed-type list

  ## Examples

    iex> Elmxir.gather_args(nil)
    nil

    iex> Elmxir.gather_args(%{"_0" => 1})
    [1]
  """
  @spec gather_args(nil) :: list
  def gather_args(nil) do [] end

  @spec gather_args(map) :: list
  def gather_args(action) do gather_args(action, 0) end

  @spec gather_args(map, integer) :: list
  def gather_args(action, index) do
    current_index = "_#{index}"
    value = Map.get(action, current_index)

    if value == nil do
      [ ]
    else
      [ value | gather_args(action, index + 1) ]
    end
  end

  @doc """
  Get the action name of an Elm object

  Defaults to nil
  """
  @spec get_action_name(map) :: string
  def get_action_name(action) do
    Map.get(action, "ctor")
  end
end
