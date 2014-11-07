defmodule Elixilorem.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixilorem,
      version: "0.0.1",
      elixir: "~> 1.0.2",
      description: "A Lorem Ipsum generator for Elixir",
      package: package,
      deps: [] ]
  end

  def application, do: []

  defp package do
    [ files: ["lib", "mix.exs", "README.md"],
      contributors: ["Garrett Amini"],
      licenses: ["MIT"],
      links: %{ "Github": "https://github.com/mgamini/elixilorem"} ]
  end
end