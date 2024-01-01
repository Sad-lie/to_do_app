defmodule ToDoApp.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ToDoApp.Todo` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> ToDoApp.Todo.create_task()

    task
  end
end
