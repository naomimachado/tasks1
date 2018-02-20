defmodule Task1.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Task1.Work.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :task_description, :string
    field :task_name, :string
    field :time_taken, :integer
    belongs_to :user, Task1.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:task_name, :task_description, :time_taken, :completed, :user_id])
    |> validate_required([:task_name, :task_description, :time_taken, :completed, :user_id])
  end
end
