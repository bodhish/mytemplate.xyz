exception UnsafeFindFailed(string)

let copyAndSort = (f, t) => {
  let cp = t |> Array.copy
  cp |> Array.sort(f)
  cp
}

let copyAndPush = (e, t) => {
  let copy = t |> Array.copy
  copy |> Js.Array.push(e) |> ignore
  copy
}

let isEmpty = a =>
  switch a {
  | [] => true
  | _ => false
  }

let isNotEmpty = a => !(a |> isEmpty)

let unsafeFind = (p, message, l) =>
  switch Js.Array.find(p, l) {
  | Some(e) => e
  | None =>
    Js.log(message)

    raise(UnsafeFindFailed(message))
  }

let flatten = t => t |> Array.to_list |> List.flatten |> Array.of_list

let flattenV2 = a => a |> Js.Array.reduce((flat, next) => flat |> Js.Array.concat(next), [])

let sort_uniq = (f, t) => t |> Array.to_list |> List.sort_uniq(f) |> Array.of_list

let getOpt = (a, i) =>
  try Some(a |> Array.get(i)) catch {
  | Not_found => None
  }

let swapUp = (i, t) =>
  if i <= 0 || i >= (t |> Array.length) {
    Js.log("Index to swap out of bounds in array!")
    t
  } else {
    let copy = t |> Array.copy
    copy[i] = t[i - 1]
    copy[i - 1] = t[i]
    copy
  }

let swapDown = (i, t) => swapUp(i + 1, t)

let remove = (a, i) => a |> Js.Array.filteri((_, index) => index != i)

let add = (collection, item, index) => {
  let length = Array.length(collection)

  if index <= length {
    let head = collection->Belt.Array.slice(~offset=0, ~len=index)
    let tail = collection->Belt.Array.sliceToEnd(index)

    Belt.Array.concatMany([head, [item], tail])
  } else {
    Js.log("Index to add out of bounds in array!")
    collection
  }
}
