[@react.component]
let make = (~data) => {
  <div>
    <Bio name={data |> Data.name} links={data |> Data.socialLinks} />
    <Section color="bg-white" title="Products">
      <ShowProducts products={data |> Data.products} />
    </Section>
    <Section color="bg-gray-100" title="Recent Projects">
      <ShowRepositories repositories={data |> Data.repositories} />
    </Section>
    <Section color="bg-white" title="Blogs">
      <DevToBlogs devToUserId={data |> Data.devToUserId} />
    </Section>
  </div>;
};
