let str = React.string;

[@react.component]
let make =
    (
      ~tags,
      ~classes="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2 mt-2",
    ) => {
  tags
  |> Array.map(tag => <span key=tag className=classes> {tag |> str} </span>)
  |> React.array;
};
