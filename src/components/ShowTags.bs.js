'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");

function str(prim) {
  return prim;
}

function ShowTags(Props) {
  var tags = Props.tags;
  var match = Props.classes;
  var classes = match !== undefined ? match : "inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2";
  return $$Array.map((function (tag) {
                return React.createElement("span", {
                            key: tag,
                            className: classes
                          }, tag);
              }), tags);
}

var make = ShowTags;

exports.str = str;
exports.make = make;
/* react Not a pure module */
