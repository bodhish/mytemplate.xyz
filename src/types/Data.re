type t = {
  name: string,
  socialLinks: array(Link.t),
  products: array(Product.t),
  repositories: array(string),
  devToUserId: string,
};

let name = t => t.name;
let socialLinks = t => t.socialLinks;
let products = t => t.products;
let repositories = t => t.repositories;
let devToUserId = t => t.devToUserId;

let decode = json => {
  Json.Decode.{
    name: json |> field("name", string),
    socialLinks: json |> field("socialLinks", Link.decodeArray),
    products: json |> field("products", array(Product.decode)),
    repositories: json |> field("repositories", array(string)),
    devToUserId: json |> field("devToUserId", string),
  };
};
