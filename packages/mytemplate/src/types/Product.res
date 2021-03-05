type t = {
  title: string,
  description: string,
  image: option<string>,
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
    image: json |> optional(field("image", string)),
    links: json |> field("links", Link.decodeArray),
    tags: json |> field("tags", array(string)),
  }
}

let encode = t => {
  open Json.Encode
  object_(list{
    ("title", string(t.title)),
    ("description", string(t.description)),
    ("image", nullable(string, t.image)),
    ("tags", array(string, t.tags)),
    ("links", array(string, Link.stringArray(t.links))),
  })
}

let encodeArray = projects =>
  projects |> {
    open Json.Encode
    array(encode)
  }

let updateTitle = (t, title) => {...t, title: title}
let updateDescription = (t, description) => {...t, description: description}
let updateImage = (t, image) => {...t, image: image}
let updateLinks = (t, links) => {...t, links: links}
let updateTags = (t, tags) => {...t, tags: tags}

let replace = (products, p, index) => products |> Js.Array.mapi((a, i) => i == index ? p : a)

let empty = () =>
  make(
    "Wortal.co",
    "Wortal is a no-code website builder created with reason react!",
    Some("https://bodhish.in/assets/stylist.jpg"),
    ["No Code", "Reason React"],
    Link.defaultArray(),
  )

let defaultArray = () => [
  make(
    "Awareness",
    "A multi-language single page serverless quiz app created with reason react. Avilable in English, French, Malayalam, Urdu and Kannada",
    Some("https://bodhish.in/assets/awareness-logo.png"),
    ["ReScript", "Reason React", "Tailwind"],
    Link.defaultArray(),
  ),
  make(
    "Afterflood",
    "A verified crowd sourced data hub for after flood recovery. Created to support 2018 Kerala Flood recovery which got 1M page visits in 4 days.",
    Some("https://bodhish.in/assets/ayushma-logo.jpg"),
    ["No Code", "Supported By Cloudflare Project Galileo"],
    Link.defaultArray(),
  ),
]

let addEmpty = products => products->Array.append([empty()])
