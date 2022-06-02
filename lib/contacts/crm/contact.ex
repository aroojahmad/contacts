defmodule Contacts.CRM.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:email, :name, :phone_number, :title]}

  schema "contacts" do
    field :email, :string
    field :name, :string
    field :phone_number, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :title, :phone_number, :email])
    |> validate_required([:name, :title, :phone_number, :email])
  end
end
