defmodule ArduinoMotorDriver.Commands do
  def stop, do: "#{left(0)}#{right(0)}"

  def left(speed) do
    "L#{map_speed(speed)}|"
  end
  def right(speed) do
    "R#{map_speed(speed)}|"
  end

  defp map_speed(speed) when speed < 0 do
    "#{map_speed_to_int_range(speed)}"
  end
  defp map_speed(speed) when speed >= 0 do
    "+#{map_speed_to_int_range(speed)}"
  end

  defp map_speed_to_int_range(speed) when speed <= 1 or speed >= -1 do
    round(speed * 255)
  end
end
