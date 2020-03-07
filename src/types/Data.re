type t = {
  name: string,
  socialLinks: array(Link.t),
  products: array(Product.t),
  repositories: array(string),
  devToUserId: string,
};

let make = (name, socialLinks, products, repositories, devToUserId) => {
  name,
  socialLinks,
  products,
  repositories,
  devToUserId,
};

let name = t => t.name;
let socialLinks = t => t.socialLinks;
let products = t => t.products;
let repositories = t => t.repositories;
let devToUserId = t => t.devToUserId;

let make = json => {
  make(
    json##name,
    json##socialLinks |> Link.makeArray,
    json##products |> Product.makeArray,
    json##repositories,
    json##devToUserId,
  );
};
