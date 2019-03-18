use Mix.Config

config :db, DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "public",
  hostname: "localhost",
  pool_size: 10

import_config "prod.secret.exs"
