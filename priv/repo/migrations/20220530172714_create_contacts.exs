defmodule Contacts.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :title, :string
      add :phone_number, :string
      add :email, :string

      timestamps()
    end
  end
end
