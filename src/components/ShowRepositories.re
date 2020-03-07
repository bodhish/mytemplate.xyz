let str = React.string;

[@react.component]
let make = (~repositories) => {
  <div className="py-4 md:py-10 bg-gray-100">
    <div className="text-center">
      <h1 className="text-5xl text-indigo-900">
        {"Recent Projects" |> str}
      </h1>
    </div>
    <div className="flex flex-row flex-wrap mx-auto max-w-5xl">
      {repositories
       |> Array.map(repositoryName =>
            <ShowRepositoryCard key=repositoryName repositoryName />
          )
       |> React.array}
    </div>
  </div>;
};
