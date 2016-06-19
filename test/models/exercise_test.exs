defmodule Guitarly.ExerciseTest do
  use Guitarly.ModelCase

  alias Guitarly.Exercise

  @valid_attrs %{content: "some content", description: "some content", duration: 42, slug: "some content", source: "some content", source_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Exercise.changeset(%Exercise{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Exercise.changeset(%Exercise{}, @invalid_attrs)
    refute changeset.valid?
  end
end
