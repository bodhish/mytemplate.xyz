[%bs.raw {|require("./tailwind.css")|}];
[%bs.raw {|require("@fortawesome/fontawesome-free/js/all.js")|}];
[@bs.module "./application"] external app: ReasonReact.reactClass = "default";
let data = [%bs.raw {|require("./data.json")|}];

Js.log(data);

ReactDOMRe.renderToElementWithId(<Home />, "root");
