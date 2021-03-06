function parse(text) {
  var el = document.createElement("html");
  el.innerHTML = text;

  let parentNode = document.getElementById("import-html");
  parentNode.appendChild(el);

  let element = document.getElementById("my-template-data");

  if (element) {
    return element.innerHTML;
  } else return null;
}

export default parse;
