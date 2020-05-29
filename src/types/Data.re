type t = {
  name: string,
  socialLinks: array(Link.t),
  products: option(array(Product.t)),
  repositories: option(array(string)),
  devToUserId: option(string),
  primaryColorString: option(string),
};

let name = t => t.name;
let socialLinks = t => t.socialLinks;
let products = t => t.products;
let repositories = t => t.repositories;
let devToUserId = t => t.devToUserId;

let primaryColor = t =>
  switch (t.primaryColorString) {
  | Some(color) => color
  | None => "indigo"
  };

let decode = json => {
  Json.Decode.{
    name: json |> field("name", string),
    socialLinks: json |> field("socialLinks", Link.decodeArray),
    products: json |> optional(field("products", array(Product.decode))),
    repositories: json |> optional(field("repositories", array(string))),
    devToUserId: json |> optional(field("devToUserId", string)),
    primaryColorString: json |> optional(field("primaryColor", string)),
  };
};
