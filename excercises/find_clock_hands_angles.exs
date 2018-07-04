defmodule ClockHandsAngles do
  @complete_circle 360

  def find(hour_as_string) do
    [hours, minutes] =
      String.split(hour_as_string, ":")
      |> Enum.map(&(Integer.parse(&1) |> elem(0)))
    hour_angle = get_angle(hours, 12)
    minutes_angle = get_angle(minutes, 60)
    {hour_angle, minutes_angle}
  end

  def get_angle(num, base) do
    module = rem(num, base)
    module * (@complete_circle / base)
  end

end

ClockHandsAngles.find("12:45") |> IO.inspect()
ClockHandsAngles.find("22:00") |> IO.inspect()
