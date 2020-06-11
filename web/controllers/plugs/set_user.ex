defmodule Discuss.Plugs.SetUser do
  # Purpose of this plug. Look at conn object, if there is user_id assign to it => Get user out of database and assign it to conn object
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  # Params is the argument that return from init
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      # red = 1 + "red"
      # "red"
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)

      # conn.assigns.user => user struct
      # if previous one fails
      true ->
        assign(conn, :user, nil)
    end
  end
end
