'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var ReasonReactRouter = require("reason-react/src/ReasonReactRouter.js");
var Data$ReactHooksTemplate = require("./types/Data.bs.js");
var Home$ReactHooksTemplate = require("./components/Home.bs.js");
var Section$ReactHooksTemplate = require("./components/Section.bs.js");
var DomUtils$ReactHooksTemplate = require("./utils/DomUtils.bs.js");
var DevToBlogs$ReactHooksTemplate = require("./components/DevToBlogs.bs.js");

((require("./tailwind.css")));

((require("@fortawesome/fontawesome-free/js/all.js")));

function str(prim) {
  return prim;
}

var data = Data$ReactHooksTemplate.decode(DomUtils$ReactHooksTemplate.parseJsonTag("my-template-data", /* () */0));

var primaryColor = Data$ReactHooksTemplate.primaryColor(data);

var textColor = "text-" + (primaryColor + "-900");

function navBar(param) {
  return React.createElement("div", {
              className: "bg-white my-4 sticky top-0"
            }, React.createElement("div", {
                  className: "flex text-white max-w-5xl mx-auto justify-between px-2 items-center py-4"
                }, React.createElement("a", {
                      className: "text-2xl font-black md:text-4xl " + textColor,
                      href: "./"
                    }, Data$ReactHooksTemplate.name(data)), React.createElement("a", {
                      className: "text-lg md:text-2xl text-gray-900",
                      href: "./"
                    }, "Home")));
}

function showBlog(param) {
  var match = Data$ReactHooksTemplate.devToUserId(data);
  return React.createElement("div", undefined, navBar(/* () */0), match !== undefined ? React.createElement(Section$ReactHooksTemplate.make, {
                    color: "bg-white",
                    title: "Blogs",
                    textColor: textColor,
                    children: React.createElement(DevToBlogs$ReactHooksTemplate.make, {
                          devToUserId: match,
                          primaryColor: primaryColor,
                          showAll: true
                        })
                  }) : null);
}

function Index$Root(Props) {
  var url = ReasonReactRouter.useUrl(undefined, /* () */0);
  var match = url.path;
  var tmp;
  var exit = 0;
  if (match && match[0] === "blog" && !match[1]) {
    tmp = showBlog(/* () */0);
  } else {
    exit = 1;
  }
  if (exit === 1) {
    tmp = React.createElement(Home$ReactHooksTemplate.make, {
          data: data,
          primaryColor: primaryColor,
          textColor: textColor
        });
  }
  return React.createElement("div", undefined, tmp);
}

var Root = {
  navBar: navBar,
  showBlog: showBlog,
  make: Index$Root
};

ReactDOMRe.renderToElementWithId(React.createElement(Index$Root, { }), "root");

exports.str = str;
exports.data = data;
exports.primaryColor = primaryColor;
exports.textColor = textColor;
exports.Root = Root;
/*  Not a pure module */
