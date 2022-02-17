defmodule Playground.Repo.Migrations.CreateLands do
  use Ecto.Migration

  def change do
    create table(:lands) do
      add :block, :integer
      add :index, :integer
      add :type, :string
      add :image, :string
      add :pos_x, :integer
      add :pos_y, :integer
      add :eth_address, :string
      add :map_address, :string
      add :description, :text
      add :name, :string
      add :sell_price, :float
      add :rent_price, :float
      add :roi, :float
      add :map_id, references(:maps, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:lands, [:map_id])
    create index(:lands, [:user_id])
  end
end
