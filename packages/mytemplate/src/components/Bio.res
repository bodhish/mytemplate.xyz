let str = React.string

@react.component
let make = (~name, ~about, ~links, ~primaryColor) =>
  <div>
    <div
      className={"bg-" ++
      (primaryColor ++
      "-900 flex flex-col h-screen justify-center items-center text-center")}>
      <div>
        <h1
          className={"text-3xl md:text-5xl text-white flex items-center hover:text-" ++
          (primaryColor ++
          "-400")}>
          {name->str}
        </h1>
      </div>
      {switch about {
      | Some(text) =>
        <div className="max-w-xl mx-auto mt-2">
          <div className="text-white text-center text-md"> {text->str} </div>
        </div>
      | None => React.null
      }}
      <ShowLinks
        links classes={"m-4 text-xl md:text-3xl text-white hover:text-" ++ (primaryColor ++ "-400")}
      />
    </div>
  </div>
