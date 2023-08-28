%%raw(`import "./tailwind.css"`)
%%raw(`import "@fortawesome/fontawesome-free/js/all.js"`)

switch ReactDOM.querySelector("#root") {
| Some(rootElement) =>
  ReactDOM.Client.Root.render(
    ReactDOM.Client.createRoot(rootElement),
        <EditorHome />
  )
| None => Js.Console.log("Could not find the main div")
}
