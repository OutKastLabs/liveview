defmodule Chirp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post" do
    field :body, :string
    field :likes_count, :integer
    field :posts, :string
    field :reposts_count, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:posts, :username, :body, :likes_count, :reposts_count])
    |> validate_required([:posts, :username, :body, :likes_count, :reposts_count])
  end
end
