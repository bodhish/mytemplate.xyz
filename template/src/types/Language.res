type t = {
  name: string,
  bites: int,
}

let name = t => t.name
let bites = t => t.bites

let decodeArray = json => {
  let d = json |> Json.Decode.dict(Json.Decode.int)
  let names = d |> Js.Dict.keys
  let values = d |> Js.Dict.values

  Belt.Array.zip(names, values) |> Array.map(((name, bites)) => {name: name, bites: bites})
}
