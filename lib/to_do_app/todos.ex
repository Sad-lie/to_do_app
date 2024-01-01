defmodule ToDoApp.Todos do
  import Ecto.Query, warn: false
  alias ToDoApp.Repo

  alias ToDoApp.Todos.Items

  def list_items() do
    query = Item |> order_by(desc: :id)
    Repo.all(query)
  end

  def get_items!(id), do: Repo.get!(Items, id)

  def create_items(attrs \\ %{}) do
    %Items{}
    |> Items.changeset(attrs)
    |> Repo.insert()
  end

  def mark_completed(id) do
    item = Repo.get(Item, id)
    item = Ecto.Changeset.change item, completed: true
    Repo.update(item)
  end

  def update_items(%Items{} = items, attrs) do
    items
    |> Items.changeset(attrs)
    |> Repo.update()
  end


  def delete_item(id) do
    item = Repo.get(Item, id)
    Repo.delete(item)
  end

  def change_items(%Items{} = items, attrs \\ %{}) do
    Items.changeset(items, attrs)
  end
end
