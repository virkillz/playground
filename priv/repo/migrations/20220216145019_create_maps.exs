defmodule Playground.Repo.Migrations.CreateMaps do
  use Ecto.Migration

  def change do
    create table(:maps) do
      add :name, :string
      add :description, :text
      add :is_visible, :boolean, default: false, null: false
      add :size, :integer
      add :image, :string

      timestamps()
    end
  end
end
