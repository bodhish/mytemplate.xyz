let str = React.string;

[@react.component]
let make = (~repositories) => {
  <div>
    {repositories
     |> Array.map(repositoryName => <ShowRepositoryCard repositoryName />)
     |> React.array}
  </div>;
};
