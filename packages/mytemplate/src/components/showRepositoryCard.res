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

let showRepo = (repo, textColor) => {
  Js.log(repo)
  <div className="max-w-lg p-4 w-full">
    <div
      className="overflow-hidden rounded-xl shadow-xl bg-gray-50 h-full flex flex-col justify-between">
      <div className="pt-4 px-6">
        <div className="flex items-center">
          <div className="bg-white rounded flex items-center justify-center p-2">
            <img src={Repo.avatarUrl(repo)} className="w-10 h-10" />
          </div>
          <div className="flex flex-col justify-end items-start space-y-0 px-3">
            <div className="font-light -mb-2 text-xl"> {str(Repo.ownerLogin(repo))} </div>
            <div className="font-bold text-2xl"> {str(Repo.name(repo))} </div>
          </div>
        </div>
        <div className="flex items-center text-gray-700 mt-2 space-x-2 ">
          <div className="rounded-xl bg-white px-3 py-1 flex items-center">
            <i className="fas fa-star mr-2" />
            <span className="font-semibold mr-1"> {str(string_of_int(Repo.stars(repo)))} </span>
            <span className="hidden md:block"> {str("Stars")} </span>
          </div>
          <div className="rounded-xl bg-white px-3 py-1 flex items-center">
            <i className="fas fa-code-branch mr-2" />
            <span className="font-semibold mr-1"> {str(string_of_int(Repo.stars(repo)))} </span>
            <span className="hidden md:block"> {str("Forks")} </span>
          </div>
          <div className="flex items-center rounded-xl bg-white px-3 py-1">
            <a href={Repo.htmlurl(repo)} target="blank" className={"flex items-center "}>
              <i className="fab fa-github mr-2" />
              <span className="hidden md:block mr-1"> {str("View on")} </span>
              <span> {str("GitHub")} </span>
            </a>
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
      <div className="px-4 pb-6">
        <ShowRepoLanguages url={repo |> Repo.languagesUrl} />
      </div>
    </div>
  </div>
}

@react.component
let make = (~repositoryName, ~textColor) => {
  let (state, setState) = React.useState(() => Loading)

  React.useEffect1(getRepos(repositoryName, setState), [repositoryName])

  switch state {
  | Loading => <div className="w-full m-4 md:w-1/2"> {SkeltonLoading.card()} </div>
  | Loaded(repo) => showRepo(repo, textColor)
  }
}
