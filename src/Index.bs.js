'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var Application = require("./application");
var Home$ReactHooksTemplate = require("./Home.bs.js");

((require("./tailwind.css")));

((require("@fortawesome/fontawesome-free/js/all.js")));

var app = Application.default;

var data = (require("./data.json"));

console.log(data);

ReactDOMRe.renderToElementWithId(React.createElement(Home$ReactHooksTemplate.make, { }), "root");

exports.app = app;
exports.data = data;
/*  Not a pure module */
