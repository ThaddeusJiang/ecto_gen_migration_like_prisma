defmodule EctoGenMigrationLikePrisma.Blog.Comment do
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: true}

  schema "Comment" do
    field :text, :string

    belongs_to :post, EctoGenMigrationLikePrisma.Blog.Post
  end
end
