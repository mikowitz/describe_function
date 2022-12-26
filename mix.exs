defmodule DescribeFunction.MixProject do
  use Mix.Project

  @version "0.1.0"
  @maintainers [
    "Michael Berkowitz"
  ]
  @links %{
    github: "https://github.com/mikowitz/graphvix"
  }

  def project do
    [
      app: :describe_function,
      version: @version,
      description: "TDD for your `describe` blocks",
      package: [
        maintainers: @maintainers,
        licenses: ["MIT"],
        links: @links
      ],
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
