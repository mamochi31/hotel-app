function showWindowCreate() {
  let results = document.getElementsByClassName("result");
  results = Array.from(results);
  if (results != "") {
    let num = 1
    results.forEach( (result) => {
      result.setAttribute("id","result" + num)
      num += 1
    });
    for ( let i = 1; i <= results.length; i++ ) {
      const result = document.getElementById("result" + i);
      result.addEventListener("mouseover", () => {
        result.setAttribute("style", "background-color: lightyellow;");
        result.addEventListener("mouseout", () => {
          result.removeAttribute("style", "background-color: lightyellow;");
        });
        result.addEventListener("dblclick", (e) => {
          const gestId = result.children[9].getAttribute("id")
          location.href = `http://localhost:3000/gests/${gestId}`;
        });
      });
    };
  };
};


if (location.pathname == "/gests/search") {
  window.addEventListener("load", () => {
    showWindowCreate();
  });
};
