'use strict';

var React = require("react");
var ShowLinks$ReactHooksTemplate = require("./ShowLinks.bs.js");

function str(prim) {
  return prim;
}

function Bio(Props) {
  var name = Props.name;
  var links = Props.links;
  return React.createElement("div", undefined, React.createElement("div", {
                  className: "bg-indigo-900 flex flex-col h-screen justify-center items-center text-center"
                }, React.createElement("div", undefined, React.createElement("h1", {
                          className: "text-5xl hover:text-green-500 text-white flex items-center"
                        }, name)), React.createElement(ShowLinks$ReactHooksTemplate.make, {
                      links: links
                    })));
}

var make = Bio;

exports.str = str;
exports.make = make;
/* react Not a pure module */
