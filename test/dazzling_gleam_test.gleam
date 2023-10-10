import gleeunit
import gleeunit/should
import gleam/http
import dazzling_gleam

pub fn main() {
  gleeunit.main()
}

pub fn create_client_with_default_base_url_test() {
  let request =
    dazzling_gleam.new()
    |> dazzling_gleam.pokemon_request("1")

  request.host
  |> should.equal("pokeapi.co")
}

pub fn set_base_url_of_client_test() {
  let request =
    dazzling_gleam.new()
    |> dazzling_gleam.with_base_url("www.example.com")
    |> dazzling_gleam.pokemon_request("1")

  request.host
  |> should.equal("www.example.com")
}

pub fn pokemon_request_test() {
  let request =
    dazzling_gleam.new()
    |> dazzling_gleam.pokemon_request("pikachu")

  request.path
  |> should.equal("/api/v2/pokemon/pikachu")

  request.method
  |> should.equal(http.Get)
}
