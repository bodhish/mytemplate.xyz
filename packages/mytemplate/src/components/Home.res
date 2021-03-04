@react.component
let make = (~data, ~primaryColor, ~textColor) =>
  <div>
    <Bio name={data |> Data.name} links={data |> Data.socialLinks} primaryColor />
    {switch data |> Data.products {
    | Some(products) =>
      <Section color="bg-white" title="Products" textColor>
        <ShowProducts products primaryColor />
      </Section>
    | None => React.null
    }}
    {switch data |> Data.repositories {
    | Some(repositories) =>
      <Section color="bg-gray-100" title="Recent Projects" textColor>
        <ShowRepositories repositories textColor />
      </Section>
    | None => React.null
    }}
    {switch data |> Data.devToUserId {
    | Some(devToUserId) =>
      <Section color="bg-white" title="Blogs" textColor>
        <DevToBlogs devToUserId primaryColor />
      </Section>
    | None => React.null
    }}
  </div>
