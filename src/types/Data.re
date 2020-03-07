type t = {
  name: string,
  socialLinks: array(Link.t),
  products: array(Product.t),
  repositories: array(string),
};

let make = (name, socialLinks, products, repositories) => {
  name,
  socialLinks,
  products,
  repositories,
};

let name = t => t.name;
let socialLinks = t => t.socialLinks;
let products = t => t.products;
let repositories = t => t.repositories;

let make = json => {
  make(
    json##name,
    json##socialLinks |> Link.makeArray,
    json##products |> Product.makeArray,
    json##repositories,
  );
};
