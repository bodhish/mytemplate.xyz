'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var Data$ReactHooksTemplate = require("./Data.bs.js");

function str(prim) {
  return prim;
}

var logo = (require('./assets/logo.jpeg'));

function Home(Props) {
  return React.createElement("div", undefined, React.createElement("div", {
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
                          }), Data$ReactHooksTemplate.socials(/* () */0)))), React.createElement("div", {
                  className: "p-10 bg-gray-100"
                }, React.createElement("div", {
                      className: "text-center"
                    }, React.createElement("h1", {
                          className: "text-5xl text-indigo-900"
                        }, "Products Built")), React.createElement("div", {
                      className: "flex flex-row justify-center items-center flex-wrap"
                    }, $$Array.map((function (project) {
                            return React.createElement("div", {
                                        className: "flex p-2 justify-center items-center flex-wrap"
                                      }, React.createElement("div", {
                                            className: "m-4 max-w-sm rounded overflow-hidden shadow-lg"
                                          }, React.createElement("img", {
                                                className: " ",
                                                alt: Data$ReactHooksTemplate.projectTitle(project),
                                                src: Data$ReactHooksTemplate.projectImage(project)
                                              }), React.createElement("div", {
                                                className: "px-6 py-4"
                                              }, React.createElement("div", {
                                                    className: "font-bold text-xl mb-2"
                                                  }, Data$ReactHooksTemplate.projectTitle(project)), React.createElement("p", {
                                                    className: "text-700 text-base"
                                                  }, Data$ReactHooksTemplate.projectDescription(project)), React.createElement("p", undefined, $$Array.map((function (link) {
                                                          return React.createElement("a", {
                                                                      href: Data$ReactHooksTemplate.url(link),
                                                                      target: "_blank"
                                                                    }, React.createElement("i", {
                                                                          className: "mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 " + Data$ReactHooksTemplate.icon(link)
                                                                        }));
                                                        }), Data$ReactHooksTemplate.projectLinks(project)))), React.createElement("div", {
                                                className: "px-6 py-4"
                                              }, $$Array.map((function (tag) {
                                                      return React.createElement("span", {
                                                                  className: "inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
                                                                }, tag);
                                                    }), Data$ReactHooksTemplate.projectTags(project)))));
                          }), Data$ReactHooksTemplate.projects(/* () */0)))));
}

var make = Home;

exports.str = str;
exports.logo = logo;
exports.make = make;
/* logo Not a pure module */
