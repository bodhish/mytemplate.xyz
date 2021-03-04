%bs.raw(`require("./tailwind.css")`)
%bs.raw(`require("@fortawesome/fontawesome-free/js/all.js")`)

let str = React.string

type props = {data: Data.t}

let data = DomUtils.parseJsonTag(~id="my-template-data", ()) |> Data.decode
let primaryColor = data |> Data.primaryColor
let textColor = "text-" ++ (primaryColor ++ "-900")

module Root = {
  let navBar = () =>
    <div className="bg-white my-4 sticky top-0">
      <div className="flex text-white max-w-5xl mx-auto justify-between px-2 items-center py-4">
        <a className={"text-2xl font-black md:text-4xl " ++ textColor} href="./">
          {data |> Data.name |> str}
        </a>
        <a className="text-lg md:text-2xl text-gray-900" href="./"> {"Home" |> str} </a>
      </div>
    </div>

  let showBlog = () =>
    <div>
      {navBar()}
      {switch data |> Data.devToUserId {
      | Some(devToUserId) =>
        <Section color="bg-white" title="Blogs" textColor>
          <DevToBlogs devToUserId showAll=true primaryColor />
        </Section>
      | None => React.null
      }}
    </div>

  @react.component
  let make = () => {
    let url = ReasonReactRouter.useUrl()
    <div>
      {switch url.path {
      | list{"blog"} => showBlog()
      | _ => <Home data primaryColor textColor />
      }}
    </div>
  }
}

ReactDOMRe.renderToElementWithId(<Root />, "root")
