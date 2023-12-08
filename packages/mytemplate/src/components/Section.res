let str = React.string

@react.component
let make = (~color, ~title, ~children) =>
  <div className={"py-6 md:py-10 " ++ color}>
    <div className="text-center">
      <h1
        className={`text-5xl text-transparent bg-clip-text bg-gradient-to-b from-${color}-500 to-${color}-900 py-1`}>
        {title->str}
      </h1>
    </div>
    children
  </div>
