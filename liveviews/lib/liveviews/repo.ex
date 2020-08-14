defmodule Liveviews.Repo do
  use Ecto.Repo,
    otp_app: :liveviews,
    adapter: Ecto.Adapters.Postgres
end
