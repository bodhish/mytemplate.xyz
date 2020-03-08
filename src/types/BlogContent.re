type t = {
  id: int,
  title: string,
  description: string,
  coverImage: option(string),
  date: string,
  tags: array(string),
  url: string,
  author: string,
  bodyHtml: string,
};

let id = t => t.id;
let title = t => t.title;
let description = t => t.description;
let coverImage = t => t.coverImage;
let date = t => t.date;
let tags = t => t.tags;
let url = t => t.url;
let author = t => t.author;
let bodyHtml = t => t.bodyHtml;

let decodeAuthor = json => {
  json |> Json.Decode.field("name", Json.Decode.string);
};

let decode = json => {
  Json.Decode.{
    id: json |> field("id", int),
    title: json |> field("title", string),
    description: json |> field("description", string),
    coverImage: json |> field("cover_image", optional(string)),
    date: json |> field("readable_publish_date", string),
    tags: json |> field("tags", array(string)),
    url: json |> field("url", string),
    bodyHtml: json |> field("body_html", string),
    author: json |> field("user", decodeAuthor),
  };
};
