defmodule PhxLiveEventSamplesWeb.PageController do
  use PhxLiveEventSamplesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
