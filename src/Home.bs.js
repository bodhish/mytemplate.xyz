'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var Data$ReactHooksTemplate = require("./Data.bs.js");

function str(prim) {
  return prim;
}

var logo = (require('./assets/logo.jpeg'));

function Home(Props) {
  return React.createElement("div", {
              className: "bg-indigo-900 flex flex-col h-screen justify-center items-center text-center"
            }, React.createElement("div", undefined, React.createElement("h1", {
                      className: "text-5xl hover:text-green-500 text-white flex items-center"
                    }, "Bodhish Thomas")), React.createElement("div", undefined, $$Array.map((function (social) {
                        return React.createElement("a", {
                                    href: Data$ReactHooksTemplate.url(social),
                                    target: "_blank"
                                  }, React.createElement("i", {
                                        className: "m-4 text-3xl text-white hover:text-green-500 fab fa-" + Data$ReactHooksTemplate.icon(social)
                                      }));
                      }), Data$ReactHooksTemplate.socials(/* () */0))), React.createElement("div", {
                  className: "m-10 flex justify-center items-center"
                }, React.createElement("h1", {
                      className: "text-5xl text-indigo-900 flex items-center"
                    }, "Products Built")));
}

var make = Home;

exports.str = str;
exports.logo = logo;
exports.make = make;
/* logo Not a pure module */
