'use strict';


function makeSocial(icon, url) {
  return /* record */[
          /* icon */icon,
          /* url */url
        ];
}

function makeProjects(title, description, image, tags) {
  return /* record */[
          /* title */title,
          /* description */description,
          /* image */image,
          /* tags */tags
        ];
}

function icon(social) {
  return social[/* icon */0];
}

function url(social) {
  return social[/* url */1];
}

function socials(param) {
  return /* array */[
          /* record */[
            /* icon */"github",
            /* url */"https://github.com/bodhish"
          ],
          /* record */[
            /* icon */"google-play",
            /* url */"https://play.google.com/store/apps/developer?id=Cresla+Infotech"
          ],
          /* record */[
            /* icon */"twitter",
            /* url */"https://twitter.com/bodhishthomas"
          ],
          /* record */[
            /* icon */"linkedin",
            /* url */"https://www.linkedin.com/in/bodhish/"
          ],
          /* record */[
            /* icon */"facebook",
            /* url */"https://facebook.com/bodhishkaringattil"
          ],
          /* record */[
            /* icon */"medium",
            /* url */"https://medium.com/@bodhish"
          ]
        ];
}

exports.makeSocial = makeSocial;
exports.makeProjects = makeProjects;
exports.icon = icon;
exports.url = url;
exports.socials = socials;
/* No side effect */
