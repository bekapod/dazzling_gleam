import gleam/http
import gleam/http/request.{Request}

pub opaque type Client {
  Client(base_url: String)
}

pub fn new() -> Client {
  Client(base_url: "pokeapi.co")
}

pub fn with_base_url(_: Client, base_url: String) -> Client {
  Client(base_url)
}

fn make_request(client: Client) -> Request(String) {
  request.new()
  |> request.set_method(http.Get)
  |> request.set_host(client.base_url)
}

pub fn pokemon_request(client: Client, id_or_name: String) -> Request(String) {
  client
  |> make_request()
  |> request.set_path("/api/v2/pokemon/" <> id_or_name)
}
