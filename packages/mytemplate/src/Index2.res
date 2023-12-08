%%raw(`import "./tailwind.css"`)
%%raw(`import "@fortawesome/fontawesome-free/js/all.js"`)

let str = React.string

type props = {data: Data.t}

let primaryColor = data => Data.primaryColor(data)
let textColor = data => "text-" ++ Data.primaryColor(data) ++ "-900"

module Root = {
  let navBar = data =>
    <div className=" my-4 sticky top-0">
      <div className="flex text-white max-w-5xl mx-auto justify-between px-2 items-center py-4">
        <a className={"text-2xl font-black md:text-4xl " ++ textColor(data)} href="./">
          {data |> Data.name |> str}
        </a>
        <a className="text-lg md:text-2xl text-gray-900" href="./"> {"Home" |> str} </a>
      </div>
    </div>

  let showBlog = data =>
    <div>
      {navBar(data)}
      {switch data |> Data.devToUserId {
      | Some(devToUserId) =>
        <Section color={primaryColor(data)} title="Blogs">
          <DevToBlogs devToUserId showAll=true primaryColor={primaryColor(data)} />
        </Section>
      | None => React.null
      }}
    </div>

  let findData = initalData => {
    switch initalData {
    | Some(d) => d
    | None => DomUtils.parseJSONTag(~id="my-template-data", ()) |> Data.decode
    }
  }
  @react.component
  let make = (~initalData=?) => {
    let url = RescriptReactRouter.useUrl()
    let data = findData(initalData)
    <div>
      {switch url.path {
      | list{"blog"} => showBlog(data)
      | _ => <Home data primaryColor={primaryColor(data)} textColor={textColor(data)} />
      }}
    </div>
  }
}

switch ReactDOM.querySelector("#root") {
| Some(rootElement) =>
  ReactDOM.Client.Root.render(ReactDOM.Client.createRoot(rootElement), <Root />)
| None => Js.Console.log("Could not find the main div")
}
