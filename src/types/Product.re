type t = {
  title: string,
  description: string,
  image: string,
  tags: array(string),
  links: array(Link.t),
};

let make = (title, description, image, tags, links) => {
  title,
  description,
  image,
  tags,
  links,
};

let image = project => project.image;
let title = project => project.title;
let description = project => project.description;
let tags = project => project.tags;
let links = project => project.links;

let makeArray = json => {
  json
  |> Array.map(p =>
       make(
         p##title,
         p##description,
         p##logo,
         p##tags,
         Link.makeArray(p##links),
       )
     );
};
