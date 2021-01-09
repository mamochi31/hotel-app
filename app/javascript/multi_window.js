function JSFrameCreate() {
  // JSFrameを生成（共通のJSFrameを使うとフォーカスの切り替えができる）
  jsFrame = new JSFrame();  //グローバル変数
};

window.addEventListener("load", JSFrameCreate);

function multiWindowOpen() {
  // 予約登録をクリックした時の処理
  const newClick = document.getElementById("menu-new");
  newClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `予約登録`,
      left: 0, top: 80, width: 800, height: 500,
      minWidth: 800,
      minHeight: 500,
      appearanceName: 'yosemite',//プリセット名は 'yosemite','redstone','popup'
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/gests/new'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // 予約検索をクリックした時の処理
  const searchClick = document.getElementById("menu-search");
  searchClick.addEventListener("click", (e) => {
    frameGestSearch = jsFrame.create({
      name: `search`,
      title: `予約検索`,
      left: 40, top: 100, width: 800, height: 500,
      minWidth: 800,
      minHeight: 500,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/gests/search/index'
    })
    frameGestSearch.hideFrameComponent('minimizeButton');
    frameGestSearch.hideFrameComponent('zoomButton');
    frameGestSearch.show();
    e.preventDefault();
  });

  // 性別作成をクリックした時の処理
  const sexClick = document.getElementById("menu-sex-create");
  sexClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `性別作成`,
      left: 0, top: 80, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/sexes'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // ランク作成をクリックした時の処理
  const rankClick = document.getElementById("menu-rank-create");
  rankClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `ランク作成`,
      left: 40, top: 100, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/ranks'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // 部屋タイプ作成をクリックした時の処理
  const roomTypeClick = document.getElementById("menu-room-type-create");
  roomTypeClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `部屋タイプ作成`,
      left: 80, top: 120, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/room_types'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // プラン作成をクリックした時の処理
  const planClick = document.getElementById("menu-plan-create");
  planClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `プラン作成`,
      left: 120, top: 140, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/plans'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // タグ作成をクリックした時の処理
  const tagClick = document.getElementById("menu-tag-create");
  tagClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `タグ作成`,
      left: 160, top: 160, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/tags'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });

  // 地域作成をクリックした時の処理
  const areaClick = document.getElementById("menu-area-create");
  areaClick.addEventListener("click", (e) => {
    const frame = jsFrame.create({
      title: `地域作成`,
      left: 200, top: 180, width: 800, height: 500,
      minWidth: 700,
      minHeight: 300,
      appearanceName: 'yosemite',
      style: {
        backgroundColor: 'rgba(220,220,220,0.8)',
      },
      url: 'http://localhost:3000/areas'
    })
    frame.hideFrameComponent('minimizeButton');
    frame.hideFrameComponent('zoomButton');
    frame.show();
    e.preventDefault();
  });
};

// rootブラウザロードの際にmultiWindowOpenを実行
if (location.pathname == "/" || location.pathname == "/gests"){
  window.addEventListener("load", () => {
    multiWindowOpen();
  });
};

// 各コード作成フレーム内で新規作成をクリックしたときの処理
function CreateWindow(path) {
  const createButton = document.getElementById("create_button");
  if (createButton != null) {
    createButton.addEventListener("click", (e) => {
      const frame = jsFrame.create({
        title: `新規作成`,
        left: 200, top: 80, width: 400, height: 180,
        minWidth: 300,
        minHeight: 150,
        appearanceName: 'yosemite',
        style: {
          backgroundColor: 'rgba(220,220,220,0.8)',
        },
        url: `http://localhost:3000/${path}/new`
      })
      frame.hideFrameComponent('minimizeButton');
      frame.hideFrameComponent('zoomButton');
      frame.show();
      e.preventDefault();
    });
  };
};

if (location.pathname.match("/sexes")) {
  window.addEventListener("load", () => {
    CreateWindow("sexes");
  });
};

if (location.pathname.match("/areas")) {
  window.addEventListener("load", () => {
    CreateWindow("areas");
  });
};

if (location.pathname.match("/ranks")) {
  window.addEventListener("load", () => {
    CreateWindow("ranks");
  });
};

if (location.pathname.match("/tags")) {
  window.addEventListener("load", () => {
    CreateWindow("tags");
  });
};

if (location.pathname.match("/plans")) {
  window.addEventListener("load", () => {
    CreateWindow("plans");
  });
};
