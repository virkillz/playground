defmodule Playground.Asset.Land do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lands" do
    field :block, :integer
    field :description, :string
    field :eth_address, :string
    field :image, :string
    field :index, :integer
    field :map_address, :string
    field :name, :string
    field :pos_x, :integer
    field :pos_y, :integer
    field :rent_price, :float
    field :roi, :float
    field :sell_price, :float
    field :type, :string
    field :map_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(land, attrs) do
    land
    |> cast(attrs, [:block, :map_id, :user_id, :index, :type, :image, :pos_x, :pos_y, :eth_address, :map_address, :description, :name, :sell_price, :rent_price, :roi])
    |> validate_required([:block, :pos_x, :pos_y])
  end
end
