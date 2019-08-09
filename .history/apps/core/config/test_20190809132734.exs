use Mix.Config

# Configure Guardian (authentication)
config :core,
       Core.Authenticator.GuardianImpl,
       secret_key: "psZ6n/fq0b444U533yKtve2R0rpjk/IxRGpuanNE92phSDy8/Z2I8lHaIugCMOY7"

# Print only warnings and errors during test
config :logger, level: :warn

config :bcrypt_elixir, :log_rounds, 4

config :rollbax,
  environment: "test"

  config :core, Drm.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
