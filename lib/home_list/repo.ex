defmodule HomeList.Repo do
  use Ecto.Repo,
    otp_app: :home_list,
    adapter: Ecto.Adapters.Postgres
end
