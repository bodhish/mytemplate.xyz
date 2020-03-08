[%bs.raw {|require("./BlogPage.css")|}];

let str = React.string;

type state =
  | Loading
  | Loaded(BlogContent.t);

let responseCB = (setState, json) => {
  setState(_ => Loaded(json |> BlogContent.decode));
};

let errorCB = () => {
  ();
};

let getBlogs = (blogId, setState, ()) => {
  let url = "https://dev.to/api/articles/" ++ blogId;
  Js.log(url);

  Api.get(url, responseCB(setState), errorCB);
  None;
};

let customImage = (index, blog) => {
  let (bgColor, textColor) =
    switch (index mod 5) {
    | 4 => ("bg-yellow-300", "text-yellow-800")
    | 3 => ("bg-blue-300", "text-blue-800")
    | 2 => ("bg-green-300", "text-green-800")
    | 1 => ("bg-red-300", "text-red-800")
    | 0 => ("bg-orange-300", "text-orange-800")
    | _ => ("bg-gray-300", "text-gray-800")
    };

  <div
    className={
      "font-semibold shadow h-48 px-6 py-6 flex flex-col justify-between "
      ++ bgColor
    }>
    <div
      className={
        "text-2xl  text-white font-semibold break overflow-hidden "
        ++ textColor
      }>
      {blog |> BlogContent.title |> str}
    </div>
    <div className="text-sm ">
      {"By " ++ (blog |> BlogContent.author) |> str}
    </div>
  </div>;
};

let showBlog = blog => {
  <div className="flex flex-row flex-wrap mx-auto max-w-5xl justify-between">
    <div className="p-4 w-full">
      <div
        className="overflow-hidden rounded-lg shadow-lg h-full hover:bg-gray-100">
        {switch (blog |> BlogContent.coverImage) {
         | Some(src) =>
           <img
             className="object-cover w-full shadow"
             src
             alt={blog |> BlogContent.title}
           />
         | None => customImage(blog |> BlogContent.id, blog)
         }}
        <div className="px-6 pt-4">
          <div className="font-bold text-xl break-all">
            {blog |> BlogContent.title |> str}
          </div>
          <p className="text-gray-700 text-base mt-2">
            {blog |> BlogContent.description |> str}
          </p>
          <div className="text-gray-700 text-base mt-1">
            <i className="fas fa-history mr-4" />
            <span> {blog |> BlogContent.date |> str} </span>
          </div>
        </div>
        <div className="px-6 pt-4 pb-4">
          {let tags = blog |> BlogContent.tags;
           <ShowTags tags />}
        </div>
        <div className="px-6 pt-4 bg-white">
          <div
            dangerouslySetInnerHTML={"__html": blog |> BlogContent.bodyHtml}
          />
        </div>
      </div>
    </div>
  </div>;
};

[@react.component]
let make = (~blogId) => {
  let (state, setState) = React.useState(() => Loading);

  React.useEffect1(getBlogs(blogId, setState), [|blogId|]);

  switch (state) {
  | Loading =>
    <div className="mx-auto max-w-5xl ">
      <div className="flex justify-between">
        {SkeltonLoading.card()}
        {SkeltonLoading.card()}
      </div>
      <div className="flex justify-between">
        {SkeltonLoading.card()}
        {SkeltonLoading.card()}
      </div>
    </div>
  | Loaded(blog) => showBlog(blog)
  };
};
