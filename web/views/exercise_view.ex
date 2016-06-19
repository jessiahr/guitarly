defmodule Guitarly.ExerciseView do
  use Guitarly.Web, :view

  def render("index.json", %{exercises: exercises}) do
    %{data: render_many(exercises, Guitarly.ExerciseView, "exercise.json")}
  end

  def render("show.json", %{exercise: exercise}) do
    %{data: render_one(exercise, Guitarly.ExerciseView, "exercise.json")}
  end

  def render("exercise.json", %{exercise: exercise}) do
    %{id: exercise.id,
      title: exercise.title,
      slug: exercise.slug,
      duration: exercise.duration,
      source_url: exercise.source_url,
      source: exercise.source,
      description: exercise.description,
      content: exercise.content}
  end
end
