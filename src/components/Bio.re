let str = React.string;

[@react.component]
let make = (~name, ~links, ~primaryColor) =>
  <div>
    <div
      className={
        "bg-"
        ++ primaryColor
        ++ "-900 flex flex-col h-screen justify-center items-center text-center"
      }>
      <div>
        <h1
          className={
            "text-3xl md:text-5xl text-white flex items-center hover:text-"
            ++ primaryColor
            ++ "-400"
          }>
          {name |> str}
        </h1>
      </div>
      <ShowLinks
        links
        classes={
          "m-4 text-xl md:text-3xl text-white hover:text-"
          ++ primaryColor
          ++ "-400"
        }
      />
    </div>
  </div>;
