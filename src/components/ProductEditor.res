let str = React.string

let updateImage = (updateProductCB, product, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  updateProductCB(Product.updateImage(product, StringUtils.makeOption(value)))
}

let productEditor = (key, product, updateProductCB) =>
  <div className="p-2">
    <div className="mt-2">
      <label
        className="inline-block tracking-wide text-xs font-semibold"
        htmlFor={"productTitle" ++ string_of_int(key)}>
        {str("Product Title")}
      </label>
      <input
        className="appearance-none h-10 mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        id={"productTitle" ++ string_of_int(key)}
        onChange={e =>
          updateProductCB(Product.updateTitle(product, ReactEvent.Form.target(e)["value"]))}
        placeholder="Type product titile here"
        type_="text"
        value={Product.title(product)}
      />
    </div>
    <div className="mt-2">
      <label
        className="inline-block tracking-wide text-xs font-semibold"
        htmlFor={"productTitle" ++ string_of_int(key)}>
        {str("Image (optional)")}
      </label>
      <input
        className="appearance-none h-10 mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        id={"productImage" ++ string_of_int(key)}
        onChange={updateImage(updateProductCB, product)}
        placeholder="Type product titile here"
        type_="text"
        value={Product.image(product)->Belt.Option.mapWithDefault("", p => p)}
      />
    </div>
    <div className="mt-2">
      <label
        className="inline-block tracking-wide text-xs font-semibold"
        htmlFor={"productDescription" ++ string_of_int(key)}>
        {str("Product Description")}
      </label>
      <textarea
        rows=3
        className="appearance-none  mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        id={"productDescription" ++ string_of_int(key)}
        onChange={e =>
          updateProductCB(Product.updateDescription(product, ReactEvent.Form.target(e)["value"]))}
        placeholder="Type description name here"
        type_="text"
        value={Product.description(product)}
      />
    </div>
    <div className="mt-2">
      <label
        className="inline-block tracking-wide text-xs font-semibold"
        htmlFor={"Links" ++ string_of_int(key)}>
        {str("Soical Links")}
      </label>
      <LinksEditor
        links={Product.links(product)}
        updateCollectionCB={links => updateProductCB(Product.updateLinks(product, links))}
      />
    </div>
    <div className="mt-2">
      <label
        className="inline-block tracking-wide text-xs font-semibold"
        htmlFor={"Links" ++ string_of_int(key)}>
        {str("Tags")}
      </label>
      <TagsEditor
        selectedTags={Product.tags(product)}
        updateTagsCB={tags => updateProductCB(Product.updateTags(product, tags))}
      />
    </div>
  </div>

@react.component
let make = (
  ~product,
  ~index,
  ~updateProductCB,
  ~collapse=true,
  ~deleteCB,
  ~showDeleteButton=false,
) => {
  let (collapse, setCollapse) = React.useState(() => collapse)
  <div className="">
    <div className="flex justify-between items-center">
      <div
        onClick={_ => setCollapse(c => !c)}
        className="py-2 px-4 flex justify-between appearance-none mt-1 cursor-pointer block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400">
        <div className="font-semibold">
          {str(StringUtils.getWithDefault("Product Name", Product.title(product)))}
        </div>
        <FaIcon className={"mr-2 fas fa-chevron-" ++ (collapse ? "up" : "down")} />
      </div>
      {showDeleteButton
        ? <div
            onClick={_ => deleteCB()}
            className="mt-1 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-red-600 hover:bg-red-100 focus:outline-none">
            <FaIcon className="fas fa-trash-alt" />
          </div>
        : React.null}
    </div>
    {collapse
      ? <div className="p-2"> {productEditor(index, product, updateProductCB)} </div>
      : React.null}
  </div>
}
