pub opaque type Client {
  Client(base_url: String)
}

pub fn new() -> Client {
  Client(base_url: "https://pokeapi.co/api/v2/")
}

pub fn get_base_url(client: Client) -> String {
  client.base_url
}

pub fn with_base_url(_: Client, base_url: String) -> Client {
  Client(base_url)
}
