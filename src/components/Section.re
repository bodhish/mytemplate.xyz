let str = React.string;

[@react.component]
let make = (~color, ~title, ~textColor, ~children) =>
  <div className={"py-6 md:py-10 " ++ color}>
    <div className="text-center">
      <h1 className={"text-5xl " ++ textColor}> {title |> str} </h1>
    </div>
    children
  </div>;
