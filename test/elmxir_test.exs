defmodule ElmxirTest do
  use ExUnit.Case
  doctest Elmxir

  test "when action is nil" do
    assert Elmxir.gather_args(nil) == []
  end

  test "when action is a map but no index" do
    assert Elmxir.gather_args(%{"_0" => 1}) == [ 1 ]
  end

  test "when action is an empty map but no index" do
    assert Elmxir.gather_args(%{}) == []
  end

  test "when action is a map with index" do
    assert Elmxir.gather_args(%{"_0" => 1, "_1" => 2, "_2" => 3}, 1) == [ 2, 3 ]
  end

  test "when action is a NoOp" do
    assert Elmxir.get_action_name(%{ "ctor" => "NoOp", "_0" => 0}) == "NoOp"
  end

  test "when action is a nothing" do
    assert Elmxir.get_action_name(%{"_0" => 0}) == nil
  end
end
