let updateInputValue = (setInputValue, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  setInputValue(_ => value)
}

@react.component
let make = (~value, ~updateValueCB, ~removeCB, ~placeholder, ~icon) => {
  let (inputValue, setInputValue) = React.useState(() => value)
  <div>
    <div className="mt-2 flex items-center">
      <div className="px-1"> <i className={"text-4xl mt-1 " ++ icon} /> </div>
      <input
        className="appearance-none mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        onChange={updateInputValue(setInputValue)}
        placeholder
        type_="text"
        value=inputValue
      />
      <div>
        <button
          onClick={_ => updateValueCB(inputValue)}
          className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-green-600 hover:bg-green-100 focus:outline-none">
          <i className="fas fa-check" />
        </button>
      </div>
      <div
        onClick={_ => {
          setInputValue(_ => "")
          removeCB()
        }}
        className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-red-600 hover:bg-red-100 focus:outline-none">
        <FaIcon className="fas fa-trash-alt" />
      </div>
    </div>
  </div>
}
