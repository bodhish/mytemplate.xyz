'use strict';

var React = require("react");
var Bio$ReactHooksTemplate = require("./Bio.bs.js");
var Data$ReactHooksTemplate = require("../types/Data.bs.js");
var ShowProducts$ReactHooksTemplate = require("./ShowProducts.bs.js");

function str(prim) {
  return prim;
}

var json = (require("../data.json"));

var data = Data$ReactHooksTemplate.make(json);

function Home(Props) {
  return React.createElement("div", undefined, React.createElement(Bio$ReactHooksTemplate.make, {
                  name: Data$ReactHooksTemplate.name(data),
                  links: Data$ReactHooksTemplate.socialLinks(data)
                }), React.createElement(ShowProducts$ReactHooksTemplate.make, {
                  products: Data$ReactHooksTemplate.products(data)
                }));
}

var make = Home;

exports.str = str;
exports.json = json;
exports.data = data;
exports.make = make;
/* json Not a pure module */
