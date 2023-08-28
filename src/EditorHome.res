@module("./assets/logo-croped.png") external logo: string = "default"

let str = React.string

type view = Editor | ImportConfig | Docs
type state = {
  data: Data.t,
  view: view,
}

type action =
  | SetEditor
  | SetImportConfig
  | SetDocs
  | UpdateData(Data.t)

let reducer = (state, action) =>
  switch action {
  | SetEditor => {...state, view: Editor}
  | SetImportConfig => {...state, view: ImportConfig}
  | SetDocs => {...state, view: Docs}

  | UpdateData(data) => {
      Dom.Storage2.setItem(
        Dom.Storage2.localStorage,
        Config.domStorageKey,
        Json.stringify(Data.encode(data)),
      )
      {...state, data: data}
    }
  }
let clearData = () => {
  Dom.Storage2.removeItem(Dom.Storage2.localStorage, Config.domStorageKey)
  DomUtils.reload()
}

let getData = () => {
  let s = Dom.Storage2.getItem(Dom.Storage2.localStorage, Config.domStorageKey)
  switch s {
  | Some(data) =>
    switch Json.parse(data) {
    | Some(d) => Data.decode(d)
    | None => Data.empty()
    }
  | None => Data.empty()
  }
}

let download = data => {
  let json = Json.stringify(Data.encode(data))

  Download.downloadFile(Config.data(data.name, json))
}

let initialState = () => {data: getData(), view: Editor}

let editProducts = (products, data, send) =>
  <div>
    {products
    |> Js.Array.mapi((product, index) => {
      let updateProductCB = p =>
        send(UpdateData(Data.updateProducts(data, Some(Product.replace(products, p, index)))))
      let delteCB = (index, ()) =>
        send(UpdateData(Data.updateProducts(data, Some(ArrayUtils.remove(products, index)))))

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
    <div
      onClick={_ => send(UpdateData(Data.updateProducts(data, Some(Product.addEmpty(products)))))}
      className="py-2 px-4 flex justify-between cursor-pointer hover:bg-gray-100 hover:font-bold border border-dashed mt-2">
      {str("Add a new product")}
    </div>
  </div>

let buttonClasses = bool =>
  bool
    ? "text-indigo-600 font-bold px-2 py-1 text-sm"
    : "text-gray-900 font-bold px-2 py-1 text-sm cursor-pointer"

let actionButtons = (state, send, classes) => {
  <div className={classes}>
    <div className={buttonClasses(state.view == Editor)} onClick={_ => send(SetEditor)}>
      {str("Editor")}
    </div>
    <div className={buttonClasses(state.view == ImportConfig)} onClick={_ => send(SetImportConfig)}>
      {str("Import")}
    </div>
    <div className={buttonClasses(state.view == Docs)} onClick={_ => send(SetDocs)}>
      {str("Docs")}
    </div>
  </div>
}

@react.component
let make = () => {
  let (state, send) = React.useReducer(reducer, initialState())

  <div className="w-full mx-auto sm:px-6 lg:px-8 lg:grid lg:grid-cols-12 lg:gap-4 bg-gray-100">
    <div className="block col-span-3 h-full">
      <nav className="sticky top-0 px-4 md:px-0 sidebar overflow-y-scroll ">
        <div className="pt-4 mr-2">
          <h1 className="hidden"> {str("mytemplate.xyz")} </h1>
          <img className="h-10" src={logo} />
          <p className="text-sm font-mono mt-1"> {str("A no-code template for developer site")} </p>
          {actionButtons(state, send, "flex -ml-2 -mb-2 mt-2")}
          {switch state.view {
          | Editor => <Editors data=state.data updateDataCB={data => send(UpdateData(data))} />
          | ImportConfig =>
            <ImportData
              updateDataCB={data => {
                send(UpdateData(data))
                send(SetEditor)
              }}
              cancelCB={_ => send(SetEditor)}
            />
          | Docs => <Docs />
          }}
        </div>
        {switch state.view {
        | Editor =>
          <div className="mt-6 py-4 mr-2">
            <button
              className="btn btn-large btn-success w-full" onClick={_ => download(state.data)}>
              <i className="fas fa-download mr-2 " /> <span> {str("Download Site")} </span>
            </button>
          </div>
        | ImportConfig
        | Docs => React.null
        }}
      </nav>
    </div>
    <main className="col-span-9 mb-6">
      <div className="py-2 px-4 md:px-0 flex justify-between items-center">
        <div> {str("Preview of website")} </div> {actionButtons(state, send, "flex -mr-2")}
      </div>
      <div className="shadow"> <Root data=state.data /> </div>
      <div className="flex justify-center mt-4">
        <a
          href="https://www.producthunt.com/posts/mytemplate?utm_source=badge-top-post-badge&utm_medium=badge&utm_souce=badge-mytemplate"
          target="_blank">
          <img
            src="https://api.producthunt.com/widgets/embed-image/v1/top-post-badge.svg?post_id=287220&theme=light&period=daily"
            alt="MyTemplate - A no-code personal website builder for developers | Product Hunt"
            width="250"
            height="54"
          />
        </a>
      </div>
      <div className="mt-4 flex justify-center items-center md:pb-0 pb-4">
        <a
          href="https://github.com/bodhish/mytemplate.xyz"
          target="blank"
          className="hover:text-indigo-500 hover:font-bold cursor-pointer">
          <i className="fab fa-github mr-2 " /> {str("Source Code")}
        </a>
        <button
          onClick={_ => clearData()}
          target="blank"
          className="ml-6 hover:text-red-500 hover:font-bold cursor-pointer">
          <i className="fas fa-trash-alt mr-2 " /> {str("Clear Cache")}
        </button>
      </div>
    </main>
  </div>
}
