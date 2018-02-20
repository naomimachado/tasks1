defmodule Task1Web.Router do
  use Task1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_current_user
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  def get_current_user(conn, params) do
    user_id = get_session(conn, :user_id)
    if user_id do
      user = Task1.Accounts.get_user!(user_id)
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Task1Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
    resources "/tasks", TaskController

#Attribution: http://www.ccs.neu.edu/home/ntuck/courses/2018/01/cs4550/notes/12-microblog/notes.html

    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Task1Web do
  #   pipe_through :api
  # end
end
