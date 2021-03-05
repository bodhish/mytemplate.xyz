let updateUserId = (setUserId, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  setUserId(_ => value)
}

@react.component
let make = (~devToUserId, ~updateUserIdCB) => {
  let (userId, setUserId) = React.useState(() => devToUserId)
  <div>
    <div className="mt-2 flex items-center">
      <div className="px-1"> <i className="fab fa-dev text-4xl mt-1" /> </div>
      <input
        className="appearance-none mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
        id="userId"
        onChange={updateUserId(setUserId)}
        placeholder="ben (Dev.to User Id)"
        type_="text"
        value=userId
      />
      <div>
        <button
          onClick={_ => updateUserIdCB(Some(userId))}
          className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-green-600 hover:bg-green-100 focus:outline-none">
          <i className="fas fa-check" />
        </button>
      </div>
      <div
        onClick={_ => {
          setUserId(_ => "")
          updateUserIdCB(None)
        }}
        className="mt-1 h-10 flex items-center justify-center bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-red-600 hover:bg-red-100 focus:outline-none">
        <FaIcon className="fas fa-trash-alt" />
      </div>
    </div>
  </div>
}
