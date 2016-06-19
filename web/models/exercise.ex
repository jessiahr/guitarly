defmodule Guitarly.Exercise do
  use Guitarly.Web, :model

  schema "exercises" do
    field :title, :string
    field :slug, :string
    field :duration, :integer
    field :source_url, :string
    field :source, :string
    field :description, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(title slug duration source_url source description content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
