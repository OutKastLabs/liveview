defmodule Chirp.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :author, :string
    field :body, :string
    field :date, :string
    field :name, :string
    field :response, :string
    field :vote, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :body, :vote, :author, :response, :date])
    |> validate_required([:name, :body, :vote, :author, :response, :date])
  end
end
