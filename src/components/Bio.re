let str = React.string;

[@react.component]
let make = (~name, ~links) =>
  <div>
    <div
      className="bg-indigo-900 flex flex-col h-screen justify-center items-center text-center">
      <div>
        <h1
          className="text-3xl md:text-5xl hover:text-green-500 text-white flex items-center">
          {name |> str}
        </h1>
      </div>
      <ShowLinks links />
    </div>
  </div>;
