defmodule Wedding.RsvpController do
  use Wedding.Web, :controller
  alias Wedding.Repo
  alias Wedding.Rsvp

  def create(conn, params) do
    Repo.insert(%Rsvp{first_name: params["first_name"],
                      last_name: params["last_name"],
                      sealing: params["sealing"],
                      luncheon: params["luncheon"]})  
    render conn, rsvps: params
  end
end