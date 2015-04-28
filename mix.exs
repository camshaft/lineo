defmodule Lineo.Mixfile do
  use Mix.Project

  def project do
    [app: :lineo,
     version: "0.0.1",
     elixir: "~> 1.0",
     description: "",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:parse_trans, github: "uwiger/parse_trans"}]
  end

  defp package do
    [files: ["src", "mix.exs", "README*"],
     contributors: ["Cameron Bytheway"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/camshaft/lineo"}]
  end
end
