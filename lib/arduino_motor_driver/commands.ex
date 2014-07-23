defmodule ArduinoMotorDriver.Commands do
  def stop, do: "R127|L127|"

  def left(speed) do
    "L#{map_speed_to_int_range(speed)}|"
  end
  def right(speed) do
    "R#{map_speed_to_int_range(speed)}|"
  end

  defp map_speed_to_int_range(speed) when speed <= 1 or speed >= -1 do
    127 + (speed * 127)
    |> round
  end
end
