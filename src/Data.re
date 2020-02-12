type link = {
  icon: string,
  url: string,
};

type project = {
  title: string,
  description: string,
  image: string,
  tags: array(string),
  links: array(link),
};

let makeLink = (icon, url) => {icon, url};

let makeProject = (title, description, image, tags, links) => {
  title,
  description,
  image,
  tags,
  links,
};

let icon = social => social.icon;
let url = social => social.url;

let projectImage = project => project.image;
let projectTitle = project => project.title;
let projectDescription = project => project.description;
let projectTags = project => project.tags;
let projectLinks = project => project.links;

let socials = () => {
  [|
    makeLink("github", "https://github.com/bodhish"),
    makeLink("npm", "https://www.npmjs.com/~bodhish"),
    makeLink(
      "google-play",
      "https://play.google.com/store/apps/developer?id=Cresla+Infotech",
    ),
    makeLink("twitter", "https://twitter.com/bodhishthomas"),
    makeLink("linkedin", "https://www.linkedin.com/in/bodhish/"),
    makeLink("facebook", "https://facebook.com/bodhishkaringattil"),
    makeLink("medium", "https://medium.com/@bodhish"),
  |];
};

let projects = () => {
  [|
    makeProject(
      "StopFaking",
      "A bot built on Facebook messenger platform that can help you identify fake news shared by others on Facebook",
      "http://bodhish.in/assets/0100.jpg",
      [|"FacebookBot", "RubyOnRails"|],
      [|
        makeLink(
          "fas fa-external-link-square-alt",
          "https://github.com/bodhish",
        ),
        makeLink("fab fa-facebook-messenger", "https://m.me/stopfaking.in"),
      |],
    ),
  |];
};
