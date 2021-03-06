let str = React.string

type state = {
  loading: bool,
  inputValue: string,
  data: option<Data.t>,
  hasErrors: bool,
}

type action =
  | SetLoading
  | SetValue(string)
  | SetData(option<Data.t>, bool)
  | SetError

let reducer = (state, action) =>
  switch action {
  | SetLoading => {...state, loading: true}
  | SetError => {...state, hasErrors: true, loading: false}
  | SetValue(value) => {...state, inputValue: value}
  | SetData(data, error) => {...state, data: data, hasErrors: error, loading: false}
  }

let updateInputValue = (send, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  send(SetValue(value))
}

let responseCB = (send, json) => {
  let data = Json.Decode.field("content", Json.Decode.string, json)

  let base64DecodedData = Webapi.Base64.atob(data)

  let jsonString = ParseHtml.parse(base64DecodedData)
  let parsedJson = Belt.Option.flatMap(Js.Nullable.toOption(jsonString), Json.parse)

  let decodeData = Belt.Option.map(parsedJson, Data.decode)
  send(SetData(decodeData, Belt.Option.isNone(decodeData)))
}

let importData = (state, send) => {
  let url = "https://api.github.com/repos/" ++ state.inputValue ++ "/contents/index.html"
  send(SetLoading)
  let errorCB = _d => send(SetError)
  Api.get(url, responseCB(send), errorCB)
}

let initialState = () => {
  data: None,
  loading: false,
  hasErrors: false,
  inputValue: "",
}

@react.component
let make = (~updateDataCB, ~cancelCB) => {
  let (state, send) = React.useReducer(reducer, initialState())
  <div className="mt-4">
    <label htmlFor="gitUrl" className="inline-block tracking-wide text-xs font-semibold">
      {str("Github Repository URL")}
    </label>
    <div className="flex items-center">
      <input
        id="gitUrl"
        className="appearance-none mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        onChange={updateInputValue(send)}
        placeholder="bodhish/bodhish.github.io"
        type_="text"
        value=state.inputValue
      />
      <div>
        <button
          onClick={_ => importData(state, send)}
          className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-green-600 hover:bg-green-100 focus:outline-none">
          <i className="fas fa-check" />
        </button>
      </div>
      <div
        onClick={_ => {
          cancelCB()
        }}
        className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-blue-600 hover:bg-blue-100 focus:outline-none">
        <FaIcon className="fas fa-arrow-left" />
      </div>
    </div>
    {state.loading
      ? <div className="mx-auto max-w-5xl ">
          <div className="flex justify-between"> {SkeltonLoading.card()} </div>
        </div>
      : {
          switch (state.hasErrors, state.data) {
          | (true, _) =>
            <div className="mt-4">
              <div>
                <div className="rounded-lg border bg-red-50 p-4 border-red-400">
                  <div className="flex items-center">
                    <div className="flex-shrink-0">
                      <i className={"fas fa-exclamation-triangle text-red-400"} />
                    </div>
                    <div className="ml-3">
                      <p className="text-sm font-medium text-red-800">
                        {str("Unable to import data from the given url.")}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          | (false, None) => React.null
          | (false, Some(data)) =>
            <div className="mt-4">
              <div>
                <div className="rounded-lg border bg-green-50 p-4 border-green-400">
                  <div className="flex items-center">
                    <div className="flex-shrink-0">
                      <i className={"fas fa-check text-green-400"} />
                    </div>
                    <div className="ml-3">
                      <p className="text-sm font-medium text-green-800">
                        {str("Data imported Successfully")}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div className="py-4">
                <button
                  className="btn btn-large btn-success w-full" onClick={_ => updateDataCB(data)}>
                  <i className="fas fa-envelope-open mr-2 " />
                  <span> {str("Open in Editor")} </span>
                </button>
              </div>
            </div>
          }
        }}
    <div id="import-html" className="hidden" />
  </div>
}
