[%bs.raw {|require("./tailwind.css")|}];
[@bs.module "./application"] external app: ReasonReact.reactClass = "default";

ReactDOMRe.renderToElementWithId(<Home />, "root");
