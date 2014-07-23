ArduinoMotorDriver
==================

Assuming you have an arduino running our arduino motor driver sketch, this can
be used in the following way:

```elixir
device = ArduinoMotorDriver.start("/dev/ttyACM0")
device |> ArduinoMotorDriver.left(1)
device |> ArduinoMotorDriver.stop
device |> ArduinoMotorDriver.left(-1)
device |> ArduinoMotorDriver.stop
device |> ArduinoMotorDriver.right(1)
device |> ArduinoMotorDriver.stop
device |> ArduinoMotorDriver.left(-1)
device |> ArduinoMotorDriver.stop
```
