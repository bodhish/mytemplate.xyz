let str = React.string;

type state =
  | Loading
  | Loaded(array(Language.t));

let responseCB = (setState, json) => {
  setState(_ => Loaded(json |> Language.decodeArray));
};

let errorCB = () => {
  ();
};

let getRepos = (url, setState, ()) => {
  Api.get(url, responseCB(setState), errorCB);
  None;
};

let showLanguages = languages => {
  <div className="flex flex-wrap">
    {languages
     |> Array.map(l => {
          <div
            className="bg-gray-100 shadow rounded px-2 py-1 m-1 text-xs"
            key={l |> Language.name}>
            {l |> Language.name |> str}
          </div>
        })
     |> React.array}
  </div>;
};

[@react.component]
let make = (~url) => {
  let (state, setState) = React.useState(() => Loading);

  React.useEffect1(getRepos(url, setState), [|url|]);

  switch (state) {
  | Loading => <div className=" w-1/2 m-4"> {SkeltonLoading.card()} </div>
  | Loaded(languages) => showLanguages(languages)
  };
};
