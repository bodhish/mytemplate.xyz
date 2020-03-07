let str = React.string;

[@react.component]
let make = (~repositories) => {
  <div className="flex flex-row flex-wrap mx-auto max-w-5xl justify-between">
    {repositories
     |> Array.map(repositoryName =>
          <ShowRepositoryCard key=repositoryName repositoryName />
        )
     |> React.array}
  </div>;
};
