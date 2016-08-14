defmodule BlogPhoenix.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def up do
    create table(:posts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :slug, :string
      add :body, :string

      timestamps
    end
  end

  def down do
    drop table(:posts)
  end
end
