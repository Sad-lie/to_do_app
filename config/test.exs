import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :to_do_app, ToDoApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "to_do_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :to_do_app, ToDoAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "5yeFBO+EN6TF8XWO7RkG7zbHCZApxOcN2TV7+ERJ+xypMj1MaR6swlMeigMVyA5p",
  server: false

# In test we don't send emails.
config :to_do_app, ToDoApp.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
