defmodule Wedding.Router do
  use Wedding.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Wedding do
    pipe_through :api

    resources "/rsvps", RsvpController
  end
end
