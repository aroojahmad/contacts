defmodule ContactsWeb.ContactController do
  use ContactsWeb, :controller

  #add a third argument, which makes it possible to do the assigns
  def index(conn, _params) do
    render(conn, "index.json")
  end

end
