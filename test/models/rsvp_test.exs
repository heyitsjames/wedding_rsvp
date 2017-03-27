defmodule Wedding.RsvpTest do
  use Wedding.ModelCase

  alias Wedding.Rsvp

  @valid_attrs %{first_name: "some content", last_name: "some content", luncheon: true, sealing: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rsvp.changeset(%Rsvp{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rsvp.changeset(%Rsvp{}, @invalid_attrs)
    refute changeset.valid?
  end
end
