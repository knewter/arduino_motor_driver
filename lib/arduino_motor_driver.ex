defmodule ArduinoMotorDriver do
  def start(device_string) do
    :serial.start([speed: 9600, open: :erlang.bitstring_to_list(device_string)])
  end
end
