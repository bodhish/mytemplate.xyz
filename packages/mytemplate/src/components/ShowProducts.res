let str = React.string

@react.component
let make = (~products, ~primaryColor) =>
  <div className="flex flex-row flex-wrap mx-auto max-w-5xl justify-between">
    {products
    |> Js.Array.mapi((product, i) =>
      <div key={string_of_int(i)} className="max-w-lg p-4 w-full">
        <div className="flex flex-col justify-between overflow-hidden rounded-lg shadow-lg h-full">
          {Product.image(product)->Belt.Option.mapWithDefault(React.null, src =>
            <div className="aspect-w-5 aspect-h-3">
              <img className=" " src alt={product |> Product.title} />
            </div>
          )}
          <div className="px-6 py-4">
            <div className="font-bold text-xl mb-2"> {product |> Product.title |> str} </div>
            <p className="text-gray-700 text-base"> {product |> Product.description |> str} </p>
            {
              let links = product |> Product.links
              <ShowLinks
                links
                classes={"mt-4 ml-2 mr-2 text-4xl text-gray-500 " ++
                (" hover:text-" ++
                (primaryColor ++ "-600"))}
              />
            }
          </div>
          <div className="px-6 py-4">
            {
              let tags = product |> Product.tags
              <ShowTags tags />
            }
          </div>
        </div>
      </div>
    )
    |> React.array}
  </div>
