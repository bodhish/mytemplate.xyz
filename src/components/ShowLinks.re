let str = React.string;

[@react.component]
let make = (~links, ~classes="m-4 text-xl md:text-3xl text-white") =>
  <div>
    {links
     |> Array.map(link => {
          let href = link |> Link.url;
          <a key=href href target="_blank">
            <i className={classes ++ " " ++ (link |> Link.icon)} />
          </a>;
        })
     |> React.array}
  </div>;
