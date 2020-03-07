[%bs.raw {|require("./tailwind.css")|}];
[%bs.raw {|require("@fortawesome/fontawesome-free/js/all.js")|}];
let json = [%bs.raw {|require("./data.json")|}];
let data = json |> Data.make;
let str = React.string;
module Root = {
  let navBar = () => {
    <div className="bg-white my-4 sticky top-0">
      <div
        className="flex text-white max-w-5xl mx-auto justify-between px-2 items-center py-4">
        <a
          className="text-2xl font-black md:text-4xl text-indigo-900"
          href="./">
          {data |> Data.name |> str}
        </a>
        <a className="text-lg md:text-2xl text-gray-900" href="./">
          {"Home" |> str}
        </a>
      </div>
    </div>;
  };

  let showBlog = () => {
    <div>
      {navBar()}
      <Section color="bg-gray-100" title="Blog">
        <DevToBlogs devToUserId={data |> Data.devToUserId} showAll=true />
      </Section>
    </div>;
  };

  [@react.component]
  let make = () => {
    let url = ReasonReactRouter.useUrl();
    <div>
      {switch (url.path) {
       | ["blog"] => showBlog()
       | _ => <Home data />
       }}
    </div>;
  };
};

ReactDOMRe.renderToElementWithId(<Root />, "root");
