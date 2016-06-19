defmodule Guitarly.ExerciseController do
  use Guitarly.Web, :controller

  alias Guitarly.Exercise

  plug :scrub_params, "exercise" when action in [:create, :update]

  def index(conn, _params) do
    exercises = Repo.all(Exercise)
    render(conn, "index.json", exercises: exercises)
  end

  def create(conn, %{"exercise" => exercise_params}) do
    changeset = Exercise.changeset(%Exercise{}, exercise_params)

    case Repo.insert(changeset) do
      {:ok, exercise} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", exercise_path(conn, :show, exercise))
        |> render("show.json", exercise: exercise)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Guitarly.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exercise = Repo.get!(Exercise, id)
    render(conn, "show.json", exercise: exercise)
  end

  def update(conn, %{"id" => id, "exercise" => exercise_params}) do
    exercise = Repo.get!(Exercise, id)
    changeset = Exercise.changeset(exercise, exercise_params)

    case Repo.update(changeset) do
      {:ok, exercise} ->
        render(conn, "show.json", exercise: exercise)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Guitarly.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exercise = Repo.get!(Exercise, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(exercise)

    send_resp(conn, :no_content, "")
  end
end
