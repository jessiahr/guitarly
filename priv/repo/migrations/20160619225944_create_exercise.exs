defmodule Guitarly.Repo.Migrations.CreateExercise do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :title, :string
      add :slug, :string
      add :duration, :integer
      add :source_url, :string
      add :source, :string
      add :description, :text
      add :content, :text

      timestamps
    end

  end
end
