let str = React.string

let add = collection => Array.append(collection, [""])

let delete = (collection, i, updateCollectionCB, ()) =>
  updateCollectionCB(collection |> Js.Array.filteri((_a, index) => index != i))

let update = (collection, i, updateCollectionCB, value) => {
  updateCollectionCB(collection |> Js.Array.mapi((a, index) => i == index ? value : a))
}

@react.component
let make = (~collection, ~updateCollectionCB, ~title="item") =>
  <div>
    {collection
    |> Js.Array.mapi((c, i) =>
      <SpecialTextEditor
        key={string_of_int(i)}
        value=c
        updateValueCB={update(collection, i, updateCollectionCB)}
        removeCB={delete(collection, i, updateCollectionCB)}
        placeholder="bodhish/mytemplate.xyz"
        icon="fab fa-github"
      />
    )
    |> React.array}
    <div className="pt-5">
      <button
        onClick={_ => updateCollectionCB(add(collection))}
        className="flex items-center text-sm font-semibold bg-gray-200 rounded border border-dashed border-gray-600 w-full hover:text-primary-500 hover:bg-white hover:border-primary-500 hover:shadow-md focus:outline-none">
        <span className="bg-gray-300 py-2 w-10"> <i className="fas fa-plus text-sm" /> </span>
        <span className="px-3 py-2"> {str("Add " ++ title)} </span>
      </button>
    </div>
  </div>
