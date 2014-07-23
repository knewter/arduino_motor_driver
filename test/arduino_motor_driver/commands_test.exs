defmodule ArduinoMotorDriver.CommandsTest do
  use ExUnit.Case
  alias ArduinoMotorDriver.Commands

  test "knows how to stop the motor" do
    assert Commands.stop == "L+0|R+0|"
  end

  test "sending motors full speed" do
    assert Commands.left(1) == "L+255|"
    assert Commands.right(1) == "R+255|"
  end

  test "sending motors half speed forward" do
    assert Commands.left(0.5) == "L+128|"
    assert Commands.right(0.5) == "R+128|"
  end

  test "sending motors full speed backwards" do
    assert Commands.left(-1) == "L-255|"
    assert Commands.right(-1) == "R-255|"
  end

  test "sending motors half speed backwards" do
    assert Commands.left(-0.5) == "L-128|"
    assert Commands.right(-0.5) == "R-128|"
  end
end
