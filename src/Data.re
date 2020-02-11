type social = {
  icon: string,
  url: string,
};

type projects = {
  title: string,
  description: string,
  image: string,
  tags: array(string),
};

let makeSocial = (icon, url) => {icon, url};

let makeProjects = (title, description, image, tags) => {
  title,
  description,
  image,
  tags,
};

let icon = social => social.icon;
let url = social => social.url;

let socials = () => {
  [|
    makeSocial("github", "https://github.com/bodhish"),
    makeSocial(
      "google-play",
      "https://play.google.com/store/apps/developer?id=Cresla+Infotech",
    ),
    makeSocial("twitter", "https://twitter.com/bodhishthomas"),
    makeSocial("linkedin", "https://www.linkedin.com/in/bodhish/"),
    makeSocial("facebook", "https://facebook.com/bodhishkaringattil"),
    makeSocial("medium", "https://medium.com/@bodhish"),
  |];
};
