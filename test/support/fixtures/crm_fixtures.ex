defmodule Contacts.CRMFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Contacts.CRM` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone_number: "some phone_number",
        title: "some title"
      })
      |> Contacts.CRM.create_contact()

    contact
  end
end
