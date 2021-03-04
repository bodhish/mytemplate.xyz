let str = React.string

type data =
  | Loading
  | Loaded(array<Blog.t>)

type state = {
  data: data,
  showAll: bool,
}

let responseCB = (setState, json) => {
  let data = json |> Json.Decode.array(Blog.decode)
  setState(state => {data: Loaded(data), showAll: state.showAll || data |> Array.length < 4})
}

let errorCB = () => ()

let getBlogs = (devToUserId, setState, ()) => {
  let url = "https://dev.to/api/articles?username=" ++ devToUserId

  Api.get(url, responseCB(setState), errorCB)
  None
}

let customImage = (index, blog) => {
  let (bgColor, textColor) = switch mod(index, 5) {
  | 4 => ("bg-yellow-300", "text-yellow-800")
  | 3 => ("bg-blue-300", "text-blue-800")
  | 2 => ("bg-green-300", "text-green-800")
  | 1 => ("bg-red-300", "text-red-800")
  | 0 => ("bg-orange-300", "text-orange-800")
  | _ => ("bg-gray-300", "text-gray-800")
  }

  <div className={"font-semibold shadow h-48 px-6 py-6 flex flex-col justify-between " ++ bgColor}>
    <div className={"text-2xl  text-white font-semibold break overflow-hidden " ++ textColor}>
      {blog |> Blog.title |> str}
    </div>
    <div className="text-sm "> {"By " ++ (blog |> Blog.author) |> str} </div>
  </div>
}

let filteredBlogs = (blogs, showAll) =>
  showAll ? blogs : blogs |> Js.Array.filteri((_, index) => index < 4)

let showBlogs = (blogs, showAll, primaryColor) =>
  <div className="mx-auto max-w-5xl">
    <div className="flex flex-row flex-wrap  justify-between">
      {filteredBlogs(blogs, showAll)
      |> Array.mapi((i, blog) =>
        <a href={blog |> Blog.url} key={blog |> Blog.url} className="max-w-lg p-4 w-full">
          <div className="overflow-hidden rounded-lg shadow-lg h-full hover:bg-gray-100">
            {switch blog |> Blog.coverImage {
            | Some(src) =>
              <img className="object-cover h-48 w-full shadow" src alt={blog |> Blog.title} />
            | None => customImage(i, blog)
            }}
            <div className="px-6 pt-4">
              <div className="font-bold text-xl break-all"> {blog |> Blog.title |> str} </div>
              <p className="text-gray-700 text-base mt-2"> {blog |> Blog.description |> str} </p>
              <div className="text-gray-700 text-base mt-1">
                <i className="fas fa-history mr-4" /> <span> {blog |> Blog.date |> str} </span>
              </div>
            </div>
            <div className="px-6 pt-4 pb-4">
              {
                let tags = blog |> Blog.tags
                <ShowTags tags />
              }
            </div>
          </div>
        </a>
      )
      |> React.array}
    </div>
    <div className="mx-auto text-center">
      {showAll
        ? React.null
        : <a
            href="./blog"
            className={"btn text-white button-xl mx-auto bg-white border text-" ++
            (primaryColor ++
            ("-900 border-" ++ (primaryColor ++ "-900")))}>
            {"Show More" |> str}
          </a>}
    </div>
  </div>

@react.component
let make = (~devToUserId, ~primaryColor, ~showAll=false) => {
  let (state, setState) = React.useState(() => {data: Loading, showAll: showAll})

  React.useEffect1(getBlogs(devToUserId, setState), [devToUserId])

  switch state.data {
  | Loading =>
    <div className="mx-auto max-w-5xl ">
      <div className="flex justify-between"> {SkeltonLoading.card()} {SkeltonLoading.card()} </div>
      <div className="flex justify-between"> {SkeltonLoading.card()} {SkeltonLoading.card()} </div>
    </div>
  | Loaded(blogs) => showBlogs(blogs, showAll, primaryColor)
  }
}
