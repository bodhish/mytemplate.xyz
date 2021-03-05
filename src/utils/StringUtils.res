let getWithDefault = (default, s) => String.trim(s) == "" ? default : s

let default = s => getWithDefault("", s)

let makeOption = s => String.trim(s) == "" ? None : Some(s)
