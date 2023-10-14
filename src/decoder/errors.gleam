import gleam/dynamic
import gleam/json

pub type DecodeError {
  ParseError(json.DecodeError)
  FieldErrors(List(dynamic.DecodeError))
}
