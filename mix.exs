defmodule BlogPhoenix.Mixfile do
  use Mix.Project

  def project do
    [app: :blog_phoenix,
     version: "0.7.0",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {BlogPhoenix, []},
     applications: [:phoenix, :cowboy, :logger,
                    :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.2.0"},
     {:phoenix_ecto, "~> 3.0.0-rc"},
     {:postgrex, ">= 0.11.0"},
     {:phoenix_live_reload, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:cowboy, "~> 1.0"},
     {:earmark, "~> 1.0"}

    ]
  end

#  defp aliases do
#    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
#     "ecto.reset": ["ecto.drop", "ecto.setup"],
#     "db.migrate": ["ecto.migrate", "ecto.dump"], # alias we added
#     "db.rollback": ["ecto.rollback", "ecto.dump"], # alias we added
#     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
#  end

end
