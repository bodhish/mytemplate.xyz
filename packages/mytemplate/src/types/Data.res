type t = {
  name: string,
  about: option<string>,
  socialLinks: array<Link.t>,
  products: option<array<Product.t>>,
  repositories: option<array<string>>,
  devToUserId: option<string>,
  primaryColorString: option<string>,
}

let name = t => t.name
let socialLinks = t => t.socialLinks
let products = t => t.products
let repositories = t => t.repositories
let devToUserId = t => t.devToUserId
let about = t => t.about

let primaryColor = t =>
  switch t.primaryColorString {
  | Some(color) => color
  | None => "indigo"
  }

let decode = json => {
  open Json.Decode
  {
    name: json |> field("name", string),
    about: json |> optional(field("about", string)),
    socialLinks: json |> field("socialLinks", Link.decodeArray),
    products: json |> optional(field("products", array(Product.decode))),
    repositories: json |> optional(field("repositories", array(string))),
    devToUserId: json |> optional(field("devToUserId", string)),
    primaryColorString: json |> optional(field("primaryColor", string)),
  }
}

let encode = t => {
  open Json.Encode
  object_(list{
    ("name", string(t.name)),
    ("about", nullable(string, t.about)),
    ("socialLinks", array(string, Link.stringArray(t.socialLinks))),
    ("devToUserId", nullable(string, t.devToUserId)),
    ("primaryColor", nullable(string, t.primaryColorString)),
    ("products", Product.encodeArray(Belt.Option.getWithDefault(t.products, []))),
    ("repositories", array(string, Belt.Option.getWithDefault(t.repositories, []))),
  })
}

let empty = () => {
  name: "John Doe",
  about: None,
  socialLinks: Link.defaultArray(),
  products: Some(Product.defaultArray()),
  repositories: Some(["bodhish/mytemplate.xyz", "pupilfirst/pupilfirst"]),
  devToUserId: Some("bodhish"),
  primaryColorString: Some("indigo"),
}

let updateProducts = (t, p) => {
  ...t,
  products: p,
}

let updateDevToId = (t, devToUserId) => {...t, devToUserId: devToUserId}
let updateRepositories = (t, repositories) => {...t, repositories: repositories}
let updateLinks = (t, socialLinks) => {...t, socialLinks: socialLinks}
let updateName = (t, name) => {...t, name: name}
let updateAbout = (t, about) => {...t, about: about}
let updatePrimaryColor = (t, primaryColorString) => {...t, primaryColorString: primaryColorString}
