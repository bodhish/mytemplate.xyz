'use strict';

var Link$ReactHooksTemplate = require("./Link.bs.js");
var Product$ReactHooksTemplate = require("./Product.bs.js");

function name(t) {
  return t[/* name */0];
}

function socialLinks(t) {
  return t[/* socialLinks */1];
}

function products(t) {
  return t[/* products */2];
}

function make(json) {
  return /* record */[
          /* name */json.name,
          /* socialLinks */Link$ReactHooksTemplate.makeArray(json.socialLinks),
          /* products */Product$ReactHooksTemplate.makeArray(json.products)
        ];
}

exports.name = name;
exports.socialLinks = socialLinks;
exports.products = products;
exports.make = make;
/* No side effect */
