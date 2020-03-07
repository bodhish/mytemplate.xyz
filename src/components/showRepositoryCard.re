let str = React.string;

type state =
  | Loading
  | Loaded(name)
and name = string;

let responseCB = (setState, json) => {
  setState(_ =>
    Loaded(json |> Json.Decode.field("full_name", Json.Decode.string))
  );
};

let errorCB = () => {
  ();
};

let getRepos = (repositoryName, setState, ()) => {
  let url = "https://api.github.com/repos/" ++ repositoryName;

  Api.get(url, responseCB(setState), errorCB);
  None;
};

[@react.component]
let make = (~repositoryName) => {
  let (state, setState) = React.useState(() => Loading);

  Js.log(repositoryName);

  // React.useEffect1(getRepos(repositoryName, setState), [|repositoryName|]);

  <div>
    {switch (state) {
     | Loading => <div> {"Skeltion Loading" |> str} </div>
     | Loaded(data) => <div> {data |> str} </div>
     }}
  </div>;
};
