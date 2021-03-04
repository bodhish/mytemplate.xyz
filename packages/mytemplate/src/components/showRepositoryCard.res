let str = React.string

type state =
  | Loading
  | Loaded(Repo.t)

let responseCB = (setState, json) => setState(_ => Loaded(json |> Repo.decode))

let errorCB = () => ()

let getRepos = (repositoryName, setState, ()) => {
  let url = "https://api.github.com/repos/" ++ repositoryName

  Api.get(url, responseCB(setState), errorCB)
  None
}

let showRepo = (repo, textColor) =>
  <div className="max-w-lg p-4 w-full">
    <div
      className="overflow-hidden rounded-lg shadow-lg h-full bg-white flex flex-col justify-between">
      <div className="py-4 px-6 bg-white shadow">
        <a
          href={"http://github.com/" ++ (repo |> Repo.name)}
          target="blank"
          className={"hover:" ++ textColor}>
          <i className="fab fa-github mr-2 font-bold text-xl" />
          <span className="font-bold text-xl"> {repo |> Repo.name |> str} </span>
        </a>
        <div className="flex text-gray-700  mt-2">
          <div className="mr-4">
            <i className="fas fa-star mr-2" />
            <span> {repo |> Repo.stars |> string_of_int |> str} </span>
          </div>
          <div>
            <i className="fas fa-code-branch mr-2" />
            <span> {repo |> Repo.forks |> string_of_int |> str} </span>
          </div>
        </div>
      </div>
      <div className=" ">
        <div className="px-6 py-1 text-sm mt-2 text-gray-700">
          {switch repo |> Repo.description {
          | Some(description) => description |> str
          | None => React.null
          }}
        </div>
      </div>
      <div className="px-6 py-1 text-sm mt-1 text-gray-700">
        {Repo.homepage(repo)->Belt.Option.mapWithDefault(React.null, link =>
          link != ""
            ? <a href=link target="blank" className={"flex items-center hover:" ++ textColor}>
                <i className="fas fa-external-link-alt mr-2" />
                <div className="truncate"> {link |> str} </div>
              </a>
            : React.null
        )}
      </div>
      <div className="px-4 pb-4"> <ShowRepoLanguages url={repo |> Repo.languagesUrl} /> </div>
    </div>
  </div>

@react.component
let make = (~repositoryName, ~textColor) => {
  let (state, setState) = React.useState(() => Loading)

  React.useEffect1(getRepos(repositoryName, setState), [repositoryName])

  switch state {
  | Loading => <div className="w-full m-4 md:w-1/2"> {SkeltonLoading.card()} </div>
  | Loaded(repo) => showRepo(repo, textColor)
  }
}
