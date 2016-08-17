# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Sensor.Sound do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_Sound_Sensor
  http://www.ti.com/lit/ds/symlink/lm358.pdf
  """

  alias Nerves.Grove.I2C

  @default_address 0x50 # I2C ADC

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) when is_integer(address) do
    I2C.ADC.start_link(address)
  end

  @spec read_value(pid, integer) :: float
  def read_value(pid, samples \\ 5) when is_pid(pid) and is_integer(samples) do
    I2C.ADC.read_value(pid, samples) |> Float.round(3)
  end
end