import gleeunit
import gleeunit/should
import dazzling_gleam

pub fn main() {
  gleeunit.main()
}

pub fn create_client_with_default_base_url_test() {
  dazzling_gleam.new()
  |> dazzling_gleam.get_base_url()
  |> should.equal("https://pokeapi.co/api/v2/")
}

pub fn set_base_url_of_client() {
  dazzling_gleam.new()
  |> dazzling_gleam.with_base_url("https://www.example.com")
  |> dazzling_gleam.get_base_url()
  |> should.equal("https://www.example.com")
}
