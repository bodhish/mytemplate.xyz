let logo: string = %raw("require('./assets/logo-croped.png')")

let str = React.string

type state = {
  data: Data.t,
  showTemplateEditor: bool,
}

type action =
  | SetShowTemplateEditor
  | ClearTemplateEditor
  | UpdateData(Data.t)

let reducer = (state, action) =>
  switch action {
  | SetShowTemplateEditor => {...state, showTemplateEditor: true}
  | ClearTemplateEditor => {...state, showTemplateEditor: false}
  | UpdateData(data) => {
      Dom.Storage2.setItem(
        Dom.Storage2.sessionStorage,
        "mytemplate-data",
        Json.stringify(Data.encode(data)),
      )
      {...state, data: data}
    }
  }

let getData = () => {
  let s = Dom.Storage2.getItem(Dom.Storage2.sessionStorage, "mytemplate-data")
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

let initialState = () => {data: getData(), showTemplateEditor: false}

let primaryColor = data => Data.primaryColor(data)
let textColor = data => "text-" ++ Data.primaryColor(data) ++ "-900"

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

@react.component
let make = () => {
  let (state, send) = React.useReducer(reducer, initialState())

  <div className="w-full mx-auto sm:px-6 lg:px-8 lg:grid lg:grid-cols-12 lg:gap-8 bg-gray-100">
    <div className="block col-span-3 h-full">
      <nav className="sticky top-0 ">
        <div className="pt-4">
          <h1 className="hidden"> {str("mytemplate.xyz")} </h1>
          <img className="h-10" src={logo} />
          <p className="text-sm font-mono mt-1"> {str("A no-code template for developer site")} </p>
          <Editors data=state.data updateDataCB={data => send(UpdateData(data))} />
        </div>
        <div className="flex-shrink-0 flex border-t border-gray-200 p-4">
          <div onClick={_ => download(state.data)}> {str("Download")} </div>
        </div>
      </nav>
    </div>
    <main className="col-span-9 mb-6">
      <div className="py-2"> {str("Preview of website")} </div>
      <div className="shadow">
        <Home
          data=state.data primaryColor={primaryColor(state.data)} textColor={textColor(state.data)}
        />
      </div>
    </main>
  </div>
}
