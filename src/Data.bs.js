'use strict';


function makeLink(icon, url) {
  return /* record */[
          /* icon */icon,
          /* url */url
        ];
}

function makeProject(title, description, image, tags, links) {
  return /* record */[
          /* title */title,
          /* description */description,
          /* image */image,
          /* tags */tags,
          /* links */links
        ];
}

function icon(social) {
  return social[/* icon */0];
}

function url(social) {
  return social[/* url */1];
}

function projectImage(project) {
  return project[/* image */2];
}

function projectTitle(project) {
  return project[/* title */0];
}

function projectDescription(project) {
  return project[/* description */1];
}

function projectTags(project) {
  return project[/* tags */3];
}

function projectLinks(project) {
  return project[/* links */4];
}

function socials(param) {
  return /* array */[
          /* record */[
            /* icon */"github",
            /* url */"https://github.com/bodhish"
          ],
          /* record */[
            /* icon */"npm",
            /* url */"https://www.npmjs.com/~bodhish"
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

function projects(param) {
  return /* array */[makeProject("StopFaking", "A bot built on Facebook messenger platform that can help you identify fake news shared by others on Facebook", "http://bodhish.in/assets/0100.jpg", /* array */[
                "FacebookBot",
                "RubyOnRails"
              ], /* array */[
                /* record */[
                  /* icon */"fas fa-external-link-square-alt",
                  /* url */"https://github.com/bodhish"
                ],
                /* record */[
                  /* icon */"fab fa-facebook-messenger",
                  /* url */"https://m.me/stopfaking.in"
                ]
              ])];
}

exports.makeLink = makeLink;
exports.makeProject = makeProject;
exports.icon = icon;
exports.url = url;
exports.projectImage = projectImage;
exports.projectTitle = projectTitle;
exports.projectDescription = projectDescription;
exports.projectTags = projectTags;
exports.projectLinks = projectLinks;
exports.socials = socials;
exports.projects = projects;
/* No side effect */
