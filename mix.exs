defmodule ApidocsGeneratorSample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :apidocs_generator_sample,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: [
        formatter_opts: [
          apidocs: [
            docsroot: "apidocs",
            snippetsoutput: "_build/snippets",
            docsoutput: "_build/apidocs",
            routers: [ApidocsGeneratorSample.Router],
            filter: fn(%{}=m) -> m |> Map.get(:pipe_through, []) |> Enum.member?(:api)
                      (_)   -> false
                    end
          ]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {ApidocsGeneratorSample, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.2.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:ex_doc, "~> 0.15.1", only: :dev, runtime: false},
      {:apidocs_generator, path: "../apidocs_generator", runtime: false},
    ]
  end
end
