'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var Home$ReactHooksTemplate = require("./Home.bs.js");

((require("./tailwind.css")));

ReactDOMRe.renderToElementWithId(React.createElement(Home$ReactHooksTemplate.make, { }), "root");

/*  Not a pure module */
