import gleam/dynamic.{bool, field, int, list, optional, string}
import gleam/json
import gleam/option
import decoder/generic.{Resource}

pub type PokemonAbility {
  PokemonAbility(ability: Resource, is_hidden: Bool, slot: Int)
}

pub type Pokemon {
  Pokemon(
    abilities: List(PokemonAbility),
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
  let resource = generic.make_resource_decoder()
  let pokemon_ability =
    dynamic.decode3(
      PokemonAbility,
      field("ability", of: resource),
      field("is_hidden", of: bool),
      field("slot", of: int),
    )

  let pokemon_decoder =
    dynamic.decode9(
      Pokemon,
      field("abilities", of: list(pokemon_ability)),
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
