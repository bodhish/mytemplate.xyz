'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var Home$ReactHooksTemplate = require("./components/Home.bs.js");

((require("./tailwind.css")));

((require("@fortawesome/fontawesome-free/js/all.js")));

ReactDOMRe.renderToElementWithId(React.createElement(Home$ReactHooksTemplate.make, { }), "root");

/*  Not a pure module */
