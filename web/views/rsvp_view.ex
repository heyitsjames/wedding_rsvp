defmodule Wedding.RsvpView do
  use Wedding.Web, :view

  def render("create.json", %{rsvps: rsvps}) do
    rsvps
  end
end