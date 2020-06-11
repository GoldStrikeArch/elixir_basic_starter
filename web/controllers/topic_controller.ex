# defmodule Discuss.TopicController do
#   use Discuss.Web, :controller

#   alias Discuss.Topic

#   def index(conn, _params) do
#     # topics = Repo.all(Topic)
#     query =
#       from(topic in Topic,
#         select: topic,
#         order_by: topic.id
#       )

#     topics = Repo.all(query)
#     render(conn, "index.html", topics: topics)
#   end

#   def new(conn, _params) do
#     changeset = Topic.changeset(%Topic{}, %{})
#     render(conn, "new.html", changeset: changeset)
#   end

#   def create(conn, %{"topic" => topic}) do
#     changeset = Topic.changeset(%Topic{}, topic)

#     case Repo.insert(changeset) do
#       {:ok, _topic} ->
#         conn
#         |> put_flash(:info, "Topic Created!")
#         |> redirect(to: topic_path(conn, :index))

#       {:error, changeset} ->
#         conn
#         |> put_flash(:error, "Could not create a topic!")
#         |> render("new.html", changeset: changeset)

#         # render(conn, "new.html", changeset: changeset)
#     end
#   end

#   def edit(conn, %{"id" => topic_id}) do
#     # Pulling out a single record inside a database, with specified "model"/type and id
#     topic = Repo.get(Topic, topic_id)
#     # Creating changeset out of this topic that came from database
#     changeset = Topic.changeset(topic)
#     # We need to know ID of the topic, so we are passing topic as a last param
#     render(conn, "edit.html", changeset: changeset, topic: topic)
#   end

#   def update(conn, %{"id" => topic_id, "topic" => topic}) do
#     old_topic = Repo.get(Topic, topic_id)
#     changeset = Topic.changeset(old_topic, topic)

#     case Repo.update(changeset) do
#       {:ok, _topic} ->
#         conn
#         |> put_flash(:info, "Topic Updated!")
#         |> redirect(to: topic_path(conn, :index))

#       {:error, changeset} ->
#         conn
#         |> put_flash(:error, "Could not update a topic!")
#         |> render("edit.html", changeset: changeset, topic: old_topic)
#     end
#   end

#   def delete(conn, %{"id" => topic_id}) do
#     Repo.get!(Topic, topic_id) |> Repo.delete!()

#     conn
#     |> put_flash(:info, "Topic Deleted!")
#     |> redirect(to: topic_path(conn, :index))
#   end
# end
defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    IO.inspect(conn.assigns)
    # topics = Repo.all(Topic)
    query =
      from(topic in Topic,
        select: topic,
        order_by: topic.id
      )

    topics = Repo.all(query)
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created!")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Could not create a topic!")
        |> render("new.html", changeset: changeset)

        # render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    # Pulling out a single record inside a database, with specified "model"/type and id
    topic = Repo.get(Topic, topic_id)
    # Creating changeset out of this topic that came from database
    changeset = Topic.changeset(topic)
    # We need to know ID of the topic, so we are passing topic as a last param
    render(conn, "edit.html", changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated!")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Could not update a topic!")
        |> render("edit.html", changeset: changeset, topic: old_topic)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!()

    conn
    |> put_flash(:info, "Topic Deleted!")
    |> redirect(to: topic_path(conn, :index))
  end
end
