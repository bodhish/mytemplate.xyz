let htmlHead = name =>
  `<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="color-scheme" content="light dark">
    <title>` ++
  name ++ `</title>
  </head>
  <body>
    <script type="application/json" id="my-template-data">
`

let htmlTail = `
    </script>
    <div id="root"></div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mytemplate.xyz@latest/build/index.css"/>
    <script src="https://cdn.jsdelivr.net/npm/mytemplate.xyz@latest/build/index.js"></script>
  </body>
</html>
`

let ensurePrimaryColor = (json) => {
  // Parse the JSON to check if primaryColor is null and set it to "indigo" if so
  let parsedJson = try {
    Some(Js.Json.parseExn(json))
  } catch {
  | _ => None
  }
  
  switch parsedJson {
  | Some(parsed) => 
    let obj = Js.Json.decodeObject(parsed)
    switch obj {
    | Some(obj) =>
      let hasPrimaryColor = Js.Dict.get(obj, "primaryColor")
      switch hasPrimaryColor {
      | None | Some(Js.Json.null) =>
        // Add or replace primaryColor with "indigo"
        Js.Dict.set(obj, "primaryColor", Js.Json.string("indigo"))
        Js.Json.stringify(Js.Json.object_(obj))
      | Some(_) => json // Keep original if primaryColor is set
      }
    | None => json
    }
  | None => json
  }
}

let data = (name, json) => htmlHead(name) ++ ensurePrimaryColor(json) ++ htmlTail

let domStorageKey = "mytemplate-data"
