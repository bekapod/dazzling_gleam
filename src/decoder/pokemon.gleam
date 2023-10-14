import gleam/dynamic.{bool, field, int, list, optional, string}
import gleam/json
import gleam/option
import gleam/result
import decoder/errors
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

pub fn decode(json_string: String) -> Result(Pokemon, errors.DecodeError) {
  let resource = generic.make_resource_decoder()
  let pokemon_ability =
    dynamic.decode3(
      PokemonAbility,
      field("ability", of: resource),
      field("is_hidden", of: bool),
      field("slot", of: int),
    )
  use dyn <- result.try(
    json.decode(json_string, dynamic.dynamic)
    |> result.map_error(fn(error) { errors.ParseError(error) }),
  )
  use abilities <- result.try(
    dyn
    |> field("abilities", of: list(pokemon_ability))
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use base_experience <- result.try(
    dyn
    |> field("base_experience", of: optional(int))
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use height <- result.try(
    dyn
    |> field("height", of: int)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use id <- result.try(
    dyn
    |> field("id", of: int)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use is_default <- result.try(
    dyn
    |> field("is_default", of: bool)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use location_area_encounters <- result.try(
    dyn
    |> field("location_area_encounters", of: string)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use name <- result.try(
    dyn
    |> field("name", of: string)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use order <- result.try(
    dyn
    |> field("order", of: int)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )
  use weight <- result.try(
    dyn
    |> field("weight", of: int)
    |> result.map_error(with: fn(error) { errors.FieldErrors(error) }),
  )

  Ok(Pokemon(
    abilities: abilities,
    base_experience: base_experience,
    height: height,
    id: id,
    is_default: is_default,
    location_area_encounters: location_area_encounters,
    name: name,
    order: order,
    weight: weight,
  ))
}
