defmodule ArduinoMotorDriver.CommandsTest do
  use ExUnit.Case
  alias ArduinoMotorDriver.Commands

  test "knows how to stop the motor" do
    assert Commands.stop == "R127|L127|"
  end

  test "sending motors full speed" do
    assert Commands.left(1) == "L254|"
    assert Commands.right(1) == "R254|"
  end

  test "sending motors half speed forward" do
    assert Commands.left(0.5) == "L191|"
    assert Commands.right(0.5) == "R191|"
  end

  test "sending motors full speed backwards" do
    assert Commands.left(-1) == "L0|"
    assert Commands.right(-1) == "R0|"
  end

  test "sending motors half speed backwards" do
    assert Commands.left(-0.5) == "L64|"
    assert Commands.right(-0.5) == "R64|"
  end
end
