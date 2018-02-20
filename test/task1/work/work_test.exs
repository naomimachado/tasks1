defmodule Task1.WorkTest do
  use Task1.DataCase

  alias Task1.Work

  describe "tasks" do
    alias Task1.Work.Task

    @valid_attrs %{completed: true, task_description: "some task_description", task_name: "some task_name", time_taken: 42}
    @update_attrs %{completed: false, task_description: "some updated task_description", task_name: "some updated task_name", time_taken: 43}
    @invalid_attrs %{completed: nil, task_description: nil, task_name: nil, time_taken: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Work.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Work.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Work.create_task(@valid_attrs)
      assert task.completed == true
      assert task.task_description == "some task_description"
      assert task.task_name == "some task_name"
      assert task.time_taken == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Work.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.completed == false
      assert task.task_description == "some updated task_description"
      assert task.task_name == "some updated task_name"
      assert task.time_taken == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_task(task, @invalid_attrs)
      assert task == Work.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Work.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Work.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Work.change_task(task)
    end
  end
end
