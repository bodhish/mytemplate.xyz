let str = React.string;

[@react.component]
let make = (~color, ~title, ~children) =>
  <div className={"py-6 md:py-10 " ++ color}>
    <div className="text-center">
      <h1 className="text-5xl text-indigo-900"> {title |> str} </h1>
    </div>
    children
  </div>;
