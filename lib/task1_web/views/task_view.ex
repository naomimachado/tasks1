defmodule Task1Web.TaskView do
  use Task1Web, :view
  import Ecto.Query

#Attribution: https://stackoverflow.com/questions/tagged/ecto
  def replace_email_with_id do
    Enum.map(Task1.Accounts.list_users(), &{&1.email, &1.id})
  end
end
