let str = React.string

let navBar = (data, textColor) =>
  <div className="border-b bg-gray-100 my-4 sticky top-0">
    <div className="flex text-white max-w-5xl mx-auto justify-between px-2 items-center py-4">
      <a className={"text-2xl font-black md:text-4xl " ++ textColor} href="./">
        {data |> Data.name |> str}
      </a>
      <a className="text-lg md:text-2xl text-gray-900" href="./"> {"Home" |> str} </a>
    </div>
  </div>

let showBlog = (data, primaryColor, textColor) =>
  <div>
    {navBar(data, textColor)}
    {switch data |> Data.devToUserId {
    | Some(devToUserId) =>
      <Section color={primaryColor} title="Blogs">
        <DevToBlogs devToUserId showAll=true primaryColor />
      </Section>
    | None => React.null
    }}
  </div>

@react.component
let make = (~data) => {
  let url = RescriptReactRouter.useUrl()
  let primaryColor = data |> Data.primaryColor
  let textColor = "text-" ++ (primaryColor ++ "-900")
  <div>
    {switch url.path {
    | list{"blog"} => showBlog(data, primaryColor, textColor)
    | _ => <Home data primaryColor textColor />
    }}
  </div>
}
