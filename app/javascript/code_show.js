// 性別詳細ページのウィンドウ作成
function sexCodeShow() {
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
      });
      result.addEventListener("mouseout", () => {
        result.removeAttribute("style", "background-color: lightyellow;");
      });
      result.addEventListener("dblclick", (e) => {
        const sexId = result.children[5].getAttribute("id")
        const frame = jsFrame.create({
          title: `詳細`,
          left: 200, top: 80, width: 400, height: 180,
          minWidth: 300,
          minHeight: 150,
          appearanceName: 'yosemite',
          style: {
            backgroundColor: 'rgba(220,220,220,0.8)',
          },
          url: `http://localhost:3000/sexes/${sexId}`
        })
        frame.hideFrameComponent('minimizeButton');
        frame.hideFrameComponent('zoomButton');
        frame.show();
        e.preventDefault();
      });
    };
  };
};

if (location.pathname == "/sexes" || location.pathname.match("/sexes/search")) {
  window.addEventListener("load", () => {
    sexCodeShow();
  });
};
