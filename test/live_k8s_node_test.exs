defmodule LiveK8sNodeTest do
  use ExUnit.Case
  doctest LiveK8sNode

  test "greets the world" do
    assert LiveK8sNode.hello() == :world
  end
end
