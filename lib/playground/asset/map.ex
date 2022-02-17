defmodule Playground.Asset.Map do
  use Ecto.Schema
  import Ecto.Changeset

  schema "maps" do
    field :description, :string
    field :image, :string
    field :is_visible, :boolean, default: false
    field :name, :string
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(map, attrs) do
    map
    |> cast(attrs, [:name, :description, :is_visible, :size, :image])
    |> validate_required([:name, :description, :is_visible, :size, :image])
  end
end
