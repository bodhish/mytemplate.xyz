let str = React.string

let add = links => Array.append(links, [Link.empty()])

let delete = (links, i) => links |> Js.Array.filteri((_a, index) => index != i)

let updateUrl = (links, i, updateCollectionCB, e) => {
  let value = ReactEvent.Form.target(e)["value"]
  updateCollectionCB(links |> Js.Array.mapi((a, index) => i == index ? Link.updateUrl(value) : a))
}

@react.component
let make = (~links, ~updateCollectionCB) =>
  <div>
    {links
    |> Js.Array.mapi((l, i) =>
      <div className="flex" key={string_of_int(i)}>
        <button
          onClick={_ => updateCollectionCB(delete(links, i))}
          className="mt-1 bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded mr-2 hover:bg-red-100 focus:outline-none"
          placeholder="Remove Link">
          <FaIcon className={Link.icon(l)} />
        </button>
        <div className="w-full">
          <input
            type_="text"
            className="appearance-none h-12 mt-1 block w-full border border-gray-400 rounded py-2 px-4 text-sm bg-gray-100 hover:bg-gray-200 focus:outline-none focus:bg-white focus:border-primary-400"
            id={"link" ++ string_of_int(i)}
            value={Link.url(l)}
            onChange={updateUrl(links, i, updateCollectionCB)}
            placeholder="Add a new Link"
          />
        </div>
        <button
          onClick={_ => updateCollectionCB(delete(links, i))}
          className="mt-1 bg-gray-200 p-2 w-11 border border-gray-400 text-gray-700 rounded ml-2 hover:text-red-600 hover:bg-red-100 focus:outline-none"
          placeholder="Remove Link">
          <i className="fas fa-trash-alt" />
        </button>
      </div>
    )
    |> React.array}
    <div className="pt-2">
      <button
        onClick={_ => updateCollectionCB(add(links))}
        className="flex items-center text-sm font-semibold bg-gray-200 rounded border border-dashed border-gray-600 w-full hover:text-primary-500 hover:bg-white hover:border-primary-500 hover:shadow-md focus:outline-none">
        <span className="bg-gray-300 py-2 w-10"> <i className="fas fa-plus text-sm" /> </span>
        <span className="px-3 py-2"> {str("Add Link")} </span>
      </button>
    </div>
  </div>
