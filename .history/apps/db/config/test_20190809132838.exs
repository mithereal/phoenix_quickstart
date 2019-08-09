use Mix.Config

# Configure your database
config :db, DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
