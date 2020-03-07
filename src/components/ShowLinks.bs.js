'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var Link$ReactHooksTemplate = require("../types/Link.bs.js");

function str(prim) {
  return prim;
}

function ShowLinks(Props) {
  var links = Props.links;
  var match = Props.classes;
  var classes = match !== undefined ? match : "m-4 text-3xl text-white hover:text-green-500";
  return React.createElement("div", undefined, $$Array.map((function (link) {
                    var href = Link$ReactHooksTemplate.url(link);
                    return React.createElement("a", {
                                key: href,
                                href: href,
                                target: "_blank"
                              }, React.createElement("i", {
                                    className: classes + (" " + Link$ReactHooksTemplate.icon(link))
                                  }));
                  }), links));
}

var make = ShowLinks;

exports.str = str;
exports.make = make;
/* react Not a pure module */
