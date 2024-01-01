defmodule ToDoApp.TodosTest do
  use ToDoApp.DataCase

  alias ToDoApp.Todos

  describe "items" do
    alias ToDoApp.Todos.Items

    import ToDoApp.TodosFixtures

    @invalid_attrs %{done: nil, title: nil}

    test "list_items/0 returns all items" do
      items = items_fixture()
      assert Todos.list_items() == [items]
    end

    test "get_items!/1 returns the items with given id" do
      items = items_fixture()
      assert Todos.get_items!(items.id) == items
    end

    test "create_items/1 with valid data creates a items" do
      valid_attrs = %{done: true, title: "some title"}

      assert {:ok, %Items{} = items} = Todos.create_items(valid_attrs)
      assert items.done == true
      assert items.title == "some title"
    end

    test "create_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_items(@invalid_attrs)
    end

    test "update_items/2 with valid data updates the items" do
      items = items_fixture()
      update_attrs = %{done: false, title: "some updated title"}

      assert {:ok, %Items{} = items} = Todos.update_items(items, update_attrs)
      assert items.done == false
      assert items.title == "some updated title"
    end

    test "update_items/2 with invalid data returns error changeset" do
      items = items_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_items(items, @invalid_attrs)
      assert items == Todos.get_items!(items.id)
    end

    test "delete_items/1 deletes the items" do
      items = items_fixture()
      assert {:ok, %Items{}} = Todos.delete_items(items)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_items!(items.id) end
    end

    test "change_items/1 returns a items changeset" do
      items = items_fixture()
      assert %Ecto.Changeset{} = Todos.change_items(items)
    end
  end
end
