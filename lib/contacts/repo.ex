defmodule Contacts.Repo do
  use Ecto.Repo,
    otp_app: :contacts,
    adapter: Ecto.Adapters.Postgres
end
