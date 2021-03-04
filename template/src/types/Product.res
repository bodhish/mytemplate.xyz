type t = {
  title: string,
  description: string,
  image: string,
  tags: array<string>,
  links: array<Link.t>,
}

let make = (title, description, image, tags, links) => {
  title: title,
  description: description,
  image: image,
  tags: tags,
  links: links,
}

let image = project => project.image
let title = project => project.title
let description = project => project.description
let tags = project => project.tags
let links = project => project.links

let decode = json => {
  open Json.Decode
  {
    title: json |> field("title", string),
    description: json |> field("description", string),
    image: json |> field("logo", string),
    links: json |> field("links", Link.decodeArray),
    tags: json |> field("tags", array(string)),
  }
}
