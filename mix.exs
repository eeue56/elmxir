defmodule Elmxir.Mixfile do
  use Mix.Project

  def project do
    [app: :elmxir,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Helper functions for working with Elm + Elixir",
     package: package,
     deps: deps]
  end

  def package do
    [
      maintainers: ["Noah Hall", "NoRedInk"],
      licenses: ["BSD3"],
      links: %{"GitHub" => "https://github.com/NoRedInk/elmxir"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:earmark, ">= 0.0.0", only: :dev},
    {:ex_doc, "~> 0.10", only: :dev}]
  end
end
