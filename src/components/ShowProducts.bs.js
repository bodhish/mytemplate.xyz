'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var React = require("react");
var Product$ReactHooksTemplate = require("../types/Product.bs.js");
var ShowTags$ReactHooksTemplate = require("./ShowTags.bs.js");
var ShowLinks$ReactHooksTemplate = require("./ShowLinks.bs.js");

function str(prim) {
  return prim;
}

function ShowProducts(Props) {
  var products = Props.products;
  return React.createElement("div", {
              className: "py-4 md:py-10 bg-gray-100"
            }, React.createElement("div", {
                  className: "text-center"
                }, React.createElement("h1", {
                      className: "text-5xl text-indigo-900"
                    }, "Projects worked on")), React.createElement("div", {
                  className: "flex flex-row flex-wrap mx-auto max-w-5xl"
                }, $$Array.map((function (product) {
                        var links = Product$ReactHooksTemplate.links(product);
                        var tags = Product$ReactHooksTemplate.tags(product);
                        return React.createElement("div", {
                                    key: Product$ReactHooksTemplate.title(product),
                                    className: "max-w-lg p-4 "
                                  }, React.createElement("div", {
                                        className: "overflow-hidden rounded-lg shadow-lg h-full"
                                      }, React.createElement("img", {
                                            className: " ",
                                            alt: Product$ReactHooksTemplate.title(product),
                                            src: Product$ReactHooksTemplate.image(product)
                                          }), React.createElement("div", {
                                            className: "px-6 py-4"
                                          }, React.createElement("div", {
                                                className: "font-bold text-xl mb-2"
                                              }, Product$ReactHooksTemplate.title(product)), React.createElement("p", {
                                                className: "text-700 text-base"
                                              }, Product$ReactHooksTemplate.description(product)), React.createElement("p", undefined, React.createElement(ShowLinks$ReactHooksTemplate.make, {
                                                    links: links,
                                                    classes: "mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500"
                                                  }))), React.createElement("div", {
                                            className: "px-6 py-4"
                                          }, React.createElement(ShowTags$ReactHooksTemplate.make, {
                                                tags: tags
                                              }))));
                      }), products)));
}

var make = ShowProducts;

exports.str = str;
exports.make = make;
/* react Not a pure module */
