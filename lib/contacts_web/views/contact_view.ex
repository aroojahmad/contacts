defmodule ContactsWeb.ContactView do
  use ContactsWeb, :view

  def render("index.json", assigns) do
   Contacts.CRM.list_contacts()
  end

end
