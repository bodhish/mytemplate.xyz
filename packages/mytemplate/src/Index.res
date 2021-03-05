%bs.raw(`require("./tailwind.css")`)
%bs.raw(`require("@fortawesome/fontawesome-free/js/all.js")`)

type props = {data: Data.t}

let data = DomUtils.parseJsonTag(~id="my-template-data", ()) |> Data.decode

ReactDOMRe.renderToElementWithId(<Root data />, "root")
