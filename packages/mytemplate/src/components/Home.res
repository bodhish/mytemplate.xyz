@react.component
let make = (~data, ~primaryColor, ~textColor) => {
  <div>
    <Bio
      name={data |> Data.name}
      about={Data.about(data)}
      links={data |> Data.socialLinks}
      primaryColor
    />
    {switch data |> Data.products {
    | Some(products) =>
      ReactUtils.nullIf(
        <Section title="Products" color={primaryColor}>
          <ShowProducts products primaryColor />
        </Section>,
        ArrayUtils.isEmpty(products),
      )

    | None => React.null
    }}
    {switch data |> Data.repositories {
    | Some(repositories) =>
      ReactUtils.nullIf(
        <Section color={primaryColor} title="Recent Projects">
          <ShowRepositories repositories textColor />
        </Section>,
        ArrayUtils.isEmpty(repositories),
      )

    | None => React.null
    }}
    {switch data |> Data.devToUserId {
    | Some(devToUserId) =>
      <Section color={primaryColor} title="Blogs">
        <DevToBlogs devToUserId primaryColor />
      </Section>
    | None => React.null
    }}
  </div>
}
