defmodule ExPbx do
  def check_speed(bool) do
    GenServer.cast(:nksip_pbx_server, {:check_speed, bool})
  end

  def get_speed() do
    GenServer.call(:nksip_pbx_server, :get_speed)
  end

  def start_trace() do
    :nksip_trace.start(:nksip_pbx_server)
  end

  def stop_trace() do
    :nksip_trace.stop(:nksip_pbx_server)
  end
end
