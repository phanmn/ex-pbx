defmodule ExPbx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      :nksip.get_sup_spec(:nksip_pbx_server, %{
        sip_local_host: "localhost",
        plugins: [:nksip_registrar, :nksip_100rel, :nksip_gruu, :nksip_outbound, :nksip_timers],
        sip_listen: "sip:all:5060"
      }),
      :nksip.get_sup_spec(:client, %{
        sip_local_host: "localhost",
        sip_from: "sip:client@127.0.0.1",
        sip_uac_auto_register_timer: 1,
        plugins: [:nksip_uac_auto_auth, :nksip_uac_auto_register],
        sip_listen: "sip:all:5070"
      })
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExPbx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
