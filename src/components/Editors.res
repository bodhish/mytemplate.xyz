let str = React.string

let editProducts = (products, data, updateDataCB) =>
  <div>
    {products
    |> Js.Array.mapi((product, index) => {
      let updateProductCB = p =>
        updateDataCB(Data.updateProducts(data, Some(Product.replace(products, p, index))))
      let delteCB = (index, ()) => {
        let newProducts = ArrayUtils.remove(products, index)
        updateDataCB(
          Data.updateProducts(data, ArrayUtils.isEmpty(newProducts) ? None : Some(newProducts)),
        )
      }

      <ProductEditor
        key={string_of_int(index)}
        index
        product
        updateProductCB
        collapse=false
        showDeleteButton=true
        deleteCB={delteCB(index)}
      />
    })
    |> React.array}
    <button
      onClick={_ => updateDataCB(Data.updateProducts(data, Some(Product.addEmpty(products))))}
      className="mt-2 flex items-center text-sm font-semibold bg-gray-200 rounded border border-dashed border-gray-600 w-full hover:text-primary-500 hover:bg-white hover:border-primary-500 hover:shadow-md focus:outline-none">
      <span className="bg-gray-300 py-2 w-10"> <i className="fas fa-plus text-sm" /> </span>
      <span className="px-3 py-2"> {str("Add a new product")} </span>
    </button>
  </div>

let updateName = (data, updateDataCB, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  updateDataCB(Data.updateName(data, value))
}

let colorPicker = (data, updateDataCB) => {
  Js.Array.map(
    color =>
      <svg
        key={color}
        onClick={_ => updateDataCB(Data.updatePrimaryColor(data, Some(color)))}
        className={"cursor-pointer h-10 w-10 text-" ++ color ++ "-900"}
        fill="currentColor"
        viewBox="0 0 8 8">
        <circle cx="4" cy="4" r="3" />
      </svg>,
    ["gray", "red", "yellow", "green", "blue", "indigo", "purple", "pink"],
  )->React.array
}

@react.component
let make = (~data: Data.t, ~updateDataCB) => {
  <div className="mt-4">
    {str("Edit settings to customize")}
    <div className="mt-2">
      <label htmlFor="name" className="inline-block tracking-wide text-xs font-semibold">
        {str("Name")}
      </label>
      <input
        type_="text"
        className="appearance-none h-12 mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        id="name"
        value=data.name
        onChange={updateName(data, updateDataCB)}
        placeholder="Enter your name"
      />
    </div>
    <div className="mt-2">
      <label htmlFor="color" className="inline-block tracking-wide text-xs font-semibold">
        {str("Primary Color")}
      </label>
      <div className="flex flex-wrap justify-around"> {colorPicker(data, updateDataCB)} </div>
    </div>
    <div className="mt-2">
      <label className="inline-block tracking-wide text-xs font-semibold">
        {str("Soical Links")}
      </label>
      <LinksEditor
        links={data.socialLinks}
        updateCollectionCB={links => updateDataCB(Data.updateLinks(data, links))}
      />
    </div>
    <div className="mt-2">
      <label className="inline-block tracking-wide text-xs font-semibold">
        {str("Products")}
      </label>
      {switch data.products {
      | Some(products) => editProducts(products, data, updateDataCB)
      | None => React.null
      }}
    </div>
    <div className="mt-2">
      <label className="inline-block tracking-wide text-xs font-semibold">
        {str("Repositories")}
      </label>
      <StringsEditor
        collection={Belt.Option.getWithDefault(data.repositories, [])}
        updateCollectionCB={r =>
          updateDataCB(Data.updateRepositories(data, ArrayUtils.isEmpty(r) ? None : Some(r)))}
        title="Repositories"
      />
    </div>
    <div className="mt-2">
      <label className="inline-block tracking-wide text-xs font-semibold">
        {str("Dev2 Blog")}
      </label>
      <DevToConfigEditor
        devToUserId={Belt.Option.getWithDefault(data.devToUserId, "")}
        updateUserIdCB={id => updateDataCB(Data.updateDevToId(data, id))}
      />
    </div>
  </div>
}
