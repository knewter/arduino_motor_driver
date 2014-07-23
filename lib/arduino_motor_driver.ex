defmodule ArduinoMotorDriver do
  alias ArduinoMotorDriver.Commands

  def start(device_string) do
    :serial.start([speed: 9600, open: :erlang.bitstring_to_list(device_string)])
  end

  def left(device, speed) do
    command(device, Commands.left(speed))
  end

  def right(device, speed) do
    command(device, Commands.right(speed))
  end

  defp command(device, message) do
    send(device, {:send, message})
  end
end
