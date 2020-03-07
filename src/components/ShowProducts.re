let str = React.string;

[@react.component]
let make = (~products) =>
  <div className="py-4 md:py-10 bg-gray-100">
    <div className="text-center">
      <h1 className="text-5xl text-indigo-900"> {"Products" |> str} </h1>
    </div>
    <div className="flex flex-row flex-wrap mx-auto max-w-5xl">
      {products
       |> Array.map(product =>
            <div key={product |> Product.title} className="max-w-lg p-4 ">
              <div className="overflow-hidden rounded-lg shadow-lg h-full">
                <img
                  className=" "
                  src={product |> Product.image}
                  alt={product |> Product.title}
                />
                <div className="px-6 py-4">
                  <div className="font-bold text-xl mb-2">
                    {product |> Product.title |> str}
                  </div>
                  <p className="text-gray-700 text-base">
                    {product |> Product.description |> str}
                  </p>
                  {let links = product |> Product.links;
                   <ShowLinks
                     links
                     classes="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500"
                   />}
                </div>
                <div className="px-6 py-4">
                  {let tags = product |> Product.tags;
                   <ShowTags tags />}
                </div>
              </div>
            </div>
          )
       |> React.array}
    </div>
  </div>;
