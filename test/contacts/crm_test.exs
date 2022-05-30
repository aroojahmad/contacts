defmodule Contacts.CRMTest do
  use Contacts.DataCase

  alias Contacts.CRM

  describe "contacts" do
    alias Contacts.CRM.Contact

    import Contacts.CRMFixtures

    @invalid_attrs %{email: nil, name: nil, phone_number: nil, title: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert CRM.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert CRM.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      valid_attrs = %{email: "some email", name: "some name", phone_number: "some phone_number", title: "some title"}

      assert {:ok, %Contact{} = contact} = CRM.create_contact(valid_attrs)
      assert contact.email == "some email"
      assert contact.name == "some name"
      assert contact.phone_number == "some phone_number"
      assert contact.title == "some title"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CRM.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", phone_number: "some updated phone_number", title: "some updated title"}

      assert {:ok, %Contact{} = contact} = CRM.update_contact(contact, update_attrs)
      assert contact.email == "some updated email"
      assert contact.name == "some updated name"
      assert contact.phone_number == "some updated phone_number"
      assert contact.title == "some updated title"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = CRM.update_contact(contact, @invalid_attrs)
      assert contact == CRM.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = CRM.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> CRM.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = CRM.change_contact(contact)
    end
  end
end
