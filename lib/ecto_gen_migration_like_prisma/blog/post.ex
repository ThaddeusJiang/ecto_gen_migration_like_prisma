defmodule EctoGenMigrationLikePrisma.Blog.Post do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "Post" do
    field :title, :string

    has_many :comments, EctoGenMigrationLikePrisma.Blog.Comment
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
