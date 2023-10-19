let htmlHead = name =>
  `<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>` ++
  name ++ `</title>
  </head>
  <body>
    <script type="application/json" id="my-template-data">
`

let htmlTail = `
    </script>
    <div id="root"></div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mytemplate.xyz@0.6/build/index.css"/>
    <script src="https://cdn.jsdelivr.net/npm/mytemplate.xyz@0.6/build/index.js"></script>
  </body>
</html>
`

let data = (name, json) => htmlHead(name) ++ json ++ htmlTail

let domStorageKey = "mytemplate-data"
