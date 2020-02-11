'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var Application = require("./application");
var Home$ReactHooksTemplate = require("./Home.bs.js");

((require("./tailwind.css")));

var app = Application.default;

ReactDOMRe.renderToElementWithId(React.createElement(Home$ReactHooksTemplate.make, { }), "root");

exports.app = app;
/*  Not a pure module */
