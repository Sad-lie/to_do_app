defmodule ToDoApp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ToDoApp.Todos` context.
  """

  @doc """
  Generate a items.
  """
  def items_fixture(attrs \\ %{}) do
    {:ok, items} =
      attrs
      |> Enum.into(%{
        done: true,
        title: "some title"
      })
      |> ToDoApp.Todos.create_items()

    items
  end
end
