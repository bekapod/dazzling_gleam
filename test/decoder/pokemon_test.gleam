import gleeunit
import gleeunit/should
import gleam/option
import decoder/pokemon
import simplifile

pub fn main() {
  gleeunit.main()
}

pub fn decode_jigglypuff_test() {
  let filepath = "./test/decoder/fixtures/pokemon/jigglypuff.json"
  let assert Ok(jigglypuff_json) = simplifile.read(filepath)
  let assert Ok(jigglypuff) = pokemon.decode(jigglypuff_json)

  jigglypuff.base_experience
  |> should.equal(option.Some(95))
  jigglypuff.height
  |> should.equal(5)
  jigglypuff.id
  |> should.equal(39)
  jigglypuff.is_default
  |> should.equal(True)
  jigglypuff.location_area_encounters
  |> should.equal("https://pokeapi.co/api/v2/pokemon/39/encounters")
  jigglypuff.name
  |> should.equal("jigglypuff")
  jigglypuff.order
  |> should.equal(71)
  jigglypuff.weight
  |> should.equal(55)
}

pub fn decode_ponyta_galar_test() {
  let filepath = "./test/decoder/fixtures/pokemon/ponyta-galar.json"
  let assert Ok(ponyta_galar_json) = simplifile.read(filepath)
  let assert Ok(ponyta_galar) = pokemon.decode(ponyta_galar_json)

  ponyta_galar.base_experience
  |> should.equal(option.Some(82))
  ponyta_galar.height
  |> should.equal(8)
  ponyta_galar.id
  |> should.equal(10_162)
  ponyta_galar.is_default
  |> should.equal(False)
  ponyta_galar.location_area_encounters
  |> should.equal("https://pokeapi.co/api/v2/pokemon/10162/encounters")
  ponyta_galar.name
  |> should.equal("ponyta-galar")
  ponyta_galar.order
  |> should.equal(122)
  ponyta_galar.weight
  |> should.equal(240)
}

pub fn decode_tinkaton_test() {
  let filepath = "./test/decoder/fixtures/pokemon/tinkaton.json"
  let assert Ok(tinkaton_json) = simplifile.read(filepath)
  let assert Ok(tinkaton) = pokemon.decode(tinkaton_json)

  tinkaton.base_experience
  |> should.equal(option.None)
  tinkaton.height
  |> should.equal(7)
  tinkaton.id
  |> should.equal(959)
  tinkaton.is_default
  |> should.equal(True)
  tinkaton.location_area_encounters
  |> should.equal("https://pokeapi.co/api/v2/pokemon/959/encounters")
  tinkaton.name
  |> should.equal("tinkaton")
  tinkaton.order
  |> should.equal(1002)
  tinkaton.weight
  |> should.equal(1128)
}
