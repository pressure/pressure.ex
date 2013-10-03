defmodule Pressuryno.Mixfile do
  use Mix.Project

  def project do
    [ app: :pressuryno,
      version: "0.0.1",
      dynamos: [Pressuryno.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/pressuryno/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Pressuryno, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0-dev", github: "elixir-lang/dynamo" } ]
  end
end
