defmodule ExPbx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_pbx,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      erlc_include_path: erlc_include_path(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools, :syntax_tools, :nkserver, :inets],
      mod: {ExPbx.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp erlc_include_path(env), do: ["_build/#{env}/lib/"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nksip, git: "https://github.com/phanmn/nksip.git", branch: "master"},
      {:cowlib, "~> 2.13", override: true},
      {:gun, "~> 2.1", override: true},
      {:rfc3339, git: "https://github.com/talentdeficit/rfc3339.git", branch: "master", override: true},
      {:nkpacket, git: "https://github.com/phanmn/nkpacket.git", override: true},
      {:nklib, [env: :prod, override: true, git: "https://github.com/byronpc/nklib", branch: "master"]}
    ]
  end
end
