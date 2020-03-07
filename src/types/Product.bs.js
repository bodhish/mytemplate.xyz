'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var Link$ReactHooksTemplate = require("./Link.bs.js");

function make(title, description, image, tags, links) {
  return /* record */[
          /* title */title,
          /* description */description,
          /* image */image,
          /* tags */tags,
          /* links */links
        ];
}

function image(project) {
  return project[/* image */2];
}

function title(project) {
  return project[/* title */0];
}

function description(project) {
  return project[/* description */1];
}

function tags(project) {
  return project[/* tags */3];
}

function links(project) {
  return project[/* links */4];
}

function makeArray(json) {
  return $$Array.map((function (p) {
                return make(p.title, p.description, p.logo, p.tags, Link$ReactHooksTemplate.makeArray(p.links));
              }), json);
}

exports.make = make;
exports.image = image;
exports.title = title;
exports.description = description;
exports.tags = tags;
exports.links = links;
exports.makeArray = makeArray;
/* No side effect */
