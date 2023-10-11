import gleam/dynamic.{field, string}

pub type Resource {
  Resource(name: String, url: String)
}

pub fn make_resource_decoder() -> dynamic.Decoder(Resource) {
  dynamic.decode2(Resource, field("name", of: string), field("url", of: string))
}
