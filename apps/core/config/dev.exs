use Mix.Config

dev_secret = "8C6FsJwjV11d+1WPUIbkEH6gB/VavJrcXWoPLujgpclfxjkLkoNFSjVU9XfeNm6s"

# General config
config :core,
  oauth: [
    facebook: [
      client_id: "506726596325615",
      client_secret: "4b320056746b8e57144c889f3baf0424",
      redirect_uri: "http://localhost:3333/login/callback/facebook"
    ]
  ]

# Guardian
config :core,
       Core.Authenticator.GuardianImpl,
       secret_key: dev_secret

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure Rollbar (errors reporting)
config :rollbax,
  environment: "dev"

# Mails
config :core, Core.Mailer, adapter: Bamboo.LocalAdapter
