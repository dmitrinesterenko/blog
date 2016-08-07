defmodule BlogPhoenix.Post do
  use BlogPhoenix.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string

    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w(slug body)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, min: 2, message: "should be at least 2 characters")
  end
end
