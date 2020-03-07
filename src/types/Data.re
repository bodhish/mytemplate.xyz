type t = {
  name: string,
  socialLinks: array(Link.t),
  products: array(Product.t),
};

let make = (name, socialLinks, products) => {name, socialLinks, products};

let name = t => t.name;
let socialLinks = t => t.socialLinks;
let products = t => t.products;

let make = json => {
  make(
    json##name,
    json##socialLinks |> Link.makeArray,
    json##products |> Product.makeArray,
  );
};
