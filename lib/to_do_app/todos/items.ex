defmodule ToDoApp.Todos.Items do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :done, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(items, attrs) do
    items
    |> cast(attrs, [:title, :done])
    |> validate_required([:title, :done])
  end
end
