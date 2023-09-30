type owner = {
  login: string,
  avatarUrl: string,
  url: string,
}

type t = {
  name: string,
  fullName: string,
  description: option<string>,
  fork: bool,
  languagesUrl: string,
  stars: int,
  forks: int,
  url: string,
  homepage: option<string>,
  owner: owner,
  htmlurl: string,
}

let name = t => t.name
let description = t => t.description
let fork = t => t.fork
let languagesUrl = t => t.languagesUrl
let stars = t => t.stars
let forks = t => t.forks
let url = t => t.url
let homepage = t => t.homepage
let owner = t => t.owner
let avatarUrl = t => t.owner.avatarUrl
let ownerUrl = t => t.owner.url
let ownerLogin = t => t.owner.login
let fullName = t => t.fullName
let htmlurl = t => t.htmlurl

let make = (
  ~name,
  ~fullName,
  ~description,
  ~fork,
  ~languagesUrl,
  ~stars,
  ~forks,
  ~url,
  ~homepage,
  ~owner,
  ~htmlurl,
) => {
  name,
  fullName,
  description,
  fork,
  languagesUrl,
  stars,
  forks,
  url,
  homepage,
  owner,
  htmlurl,
}

let ownerDecode = json => {
  open Json.Decode
  {
    login: json |> field("login", string),
    avatarUrl: json |> field("avatar_url", string),
    url: json |> field("url", string),
  }
}

let decode = json => {
  open Json.Decode
  {
    name: json |> field("name", string),
    fullName: json |> field("full_name", string),
    description: json |> optional(field("description", string)),
    fork: json |> field("fork", bool),
    languagesUrl: json |> field("languages_url", string),
    stars: json |> field("stargazers_count", int),
    forks: json |> field("forks", int),
    url: json |> field("url", string),
    homepage: json |> optional(field("homepage", string)),
    owner: json |> field("owner", ownerDecode),
    htmlurl: json |> field("html_url", string),
  }
}
