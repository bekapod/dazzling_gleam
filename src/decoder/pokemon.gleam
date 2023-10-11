import gleam/dynamic.{bool, field, int, optional, string}
import gleam/json
import gleam/option

pub type Pokemon {
  Pokemon(
    base_experience: option.Option(Int),
    height: Int,
    id: Int,
    is_default: Bool,
    location_area_encounters: String,
    name: String,
    order: Int,
    weight: Int,
  )
}

pub fn decode(json_string: String) -> Result(Pokemon, json.DecodeError) {
  let pokemon_decoder =
    dynamic.decode8(
      Pokemon,
      field("base_experience", of: optional(int)),
      field("height", of: int),
      field("id", of: int),
      field("is_default", of: bool),
      field("location_area_encounters", of: string),
      field("name", of: string),
      field("order", of: int),
      field("weight", of: int),
    )

  json.decode(json_string, pokemon_decoder)
}
