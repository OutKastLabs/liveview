defmodule Reactor.Radar do
  use Crawly.Spider

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: "https://elixir-radar.com/jobs"

  @impl Crawly.Spider
  def init(), do: [start_urls: ["https://elixir-radar.com/jobs"]]

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)
    hrefs = document |> Floki.find("a.more") |> Floki.attribute("href")

    requests =
      Utils.build_absolute_urls(hrefs, base_url())
      |> Utils.requests_from_urls()

    title = document |> Floki.find("article.blog_post h1") |> Floki.text()

    %{
      :requests => requests,
      :items => [%{title: title, url: response.request_url}]
    }
  end
end
