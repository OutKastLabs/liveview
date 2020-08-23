defmodule Chirp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :body, :string
      add :vote, :integer
      add :author, :string
      add :response, :string
      add :date, :string

      timestamps()
    end

  end
end
