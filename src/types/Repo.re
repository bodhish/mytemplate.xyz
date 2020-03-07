type t = {
  name: string,
  description: string,
  fork: bool,
  languagesUrl: string,
  stars: int,
  forks: int,
  url: string,
};

let name = t => t.name;
let description = t => t.description;
let fork = t => t.fork;
let languagesUrl = t => t.languagesUrl;
let stars = t => t.stars;
let forks = t => t.forks;
let url = t => t.url;

let make = (~name, ~description, ~fork, ~languagesUrl, ~stars, ~forks, ~url) => {
  name,
  description,
  fork,
  languagesUrl,
  stars,
  forks,
  url,
};

let decode = json => {
  Json.Decode.{
    name: json |> field("full_name", string),
    description: json |> field("description", string),
    fork: json |> field("fork", bool),
    languagesUrl: json |> field("languages_url", string),
    stars: json |> field("stargazers_count", int),
    forks: json |> field("forks", int),
    url: json |> field("url", string),
  };
};
