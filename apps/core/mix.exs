defmodule Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :core,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Core.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kaur, "~> 1.1"},
      {:bcrypt_elixir, "~> 1.0"},
      {:guardian, "~> 1.1.0"},
      {:guardian_db, "~> 1.1.0"},
      {:floki, "~> 0.20.2"},
      {:html_entities, "~> 0.3"},
      {:httpoison, "~> 0.11"},
      {:poison, "~> 3.1"},
      {:csv, "~> 1.4.4"},
      {:timex, "~> 3.0"},
      {:not_qwerty123, "~> 2.2"},
      {:bamboo, github: "thoughtbot/bamboo"},
      {:hackney, "~> 1.6"},
      {:oauth2, "~> 0.9"},
      {:rollbax, ">= 0.0.0"},
      {:sweet_xml, "~> 0.6"},
      {:burnex, "~> 1.0"},
      {:yaml_elixir, "~> 2.1.0"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:db, in_umbrella: true}
    ]
  end
end
