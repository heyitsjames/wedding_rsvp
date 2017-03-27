defmodule Wedding.Rsvp do
  use Wedding.Web, :model

  schema "rsvps" do
    field :first_name, :string
    field :last_name, :string
    field :luncheon, :boolean, default: false
    field :sealing, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :luncheon, :sealing])
    |> validate_required([:first_name, :last_name, :luncheon, :sealing])
  end
end
