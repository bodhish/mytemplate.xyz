%%raw(`import "./tailwind.css"`)
%%raw(`import "@fortawesome/fontawesome-free/js/all.js"`)

type props = {data: Data.t}

let data = DomUtils.parseJSONTag(~id="my-template-data", ()) |> Data.decode

switch ReactDOM.querySelector("#root") {
| Some(rootElement) =>
  ReactDOM.Client.Root.render(
    ReactDOM.Client.createRoot(rootElement),
        <Root data/>
  )
| None => Js.Console.log("Could not find the main div")
}
