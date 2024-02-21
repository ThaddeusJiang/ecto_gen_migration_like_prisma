defmodule EctoGenMigrationLikePrisma.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EctoGenMigrationLikePrismaWeb.Telemetry,
      EctoGenMigrationLikePrisma.Repo,
      {DNSCluster, query: Application.get_env(:ecto_gen_migration_like_prisma, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EctoGenMigrationLikePrisma.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EctoGenMigrationLikePrisma.Finch},
      # Start a worker by calling: EctoGenMigrationLikePrisma.Worker.start_link(arg)
      # {EctoGenMigrationLikePrisma.Worker, arg},
      # Start to serve requests, typically the last entry
      EctoGenMigrationLikePrismaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoGenMigrationLikePrisma.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EctoGenMigrationLikePrismaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
