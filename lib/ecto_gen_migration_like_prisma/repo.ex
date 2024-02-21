defmodule EctoGenMigrationLikePrisma.Repo do
  use Ecto.Repo,
    otp_app: :ecto_gen_migration_like_prisma,
    adapter: Ecto.Adapters.Postgres
end
