// 性別フォームに入力があった際に予測変換を表示する処理
function sexSearch() {
  // 入力フォームを取得
  const inputSexForm = document.getElementById("sex_form");
  // 入力フォームに入力があったときにイベント発火
  inputSexForm.addEventListener("keyup", () => {
    // 入力された文字列を取得
    const sexKeyword = document.getElementById("sex_form").value;

    // 取得した文字列を元に非同期通信でコードを検索
    const sexXHR = new XMLHttpRequest();
    sexXHR.open("GET", `/gests/code/search/sex/?sexKeyword=${sexKeyword}`, true);
    sexXHR.responseType = "json";
    sexXHR.send();
    sexXHR.onload = () => {
      // 予測変換の表示場所を取得
      const sexSearchResult = document.getElementById("sex_search_result");
      // 文字列が変わるたびに前回の検索結果をリセット
      sexSearchResult.innerHTML = "";
      // 挿入するためのhtml変数を定義
      let html = "";

      // レスポンスデータがある場合に処理を実行
      if (sexXHR.response) {
        // 返却された配列データを変数に定義
        const sexes = sexXHR.response.sexKeyword;
        // 返却された配列データの変数から取り出し
        sexes.forEach((sex) => {
          // 表示させるための要素を作成
          html += `<div class="code_child" id="${sex.name}">` + sex.code + "：" + sex.name + "</div>";
        });
        // 作成した要素をブラウザに挿入
        sexSearchResult.innerHTML = html;

        // 予測変換をクリックするとクリックしたコードを入力される
        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById("sex_form").value = codeChild.innerHTML.split("：")[0];
          });
        });

        // 入力フォームからフォーカスが外れると予測変換が消えるように設定
        inputSexForm.addEventListener("blur", () => {
          sexSearchResult.innerHTML = "";
        });
      };
    };
  });
};

// ランクフォームに入力があった際に予測変換を表示する処理
function rankSearch() {
  const inputRankForm = document.getElementById("rank_form");
  inputRankForm.addEventListener("keyup", () => {
    const rankKeyword = document.getElementById("rank_form").value;
    
    const rankXHR = new XMLHttpRequest();
    rankXHR.open("GET", `/gests/code/search/rank/?rankKeyword=${rankKeyword}`, true);
    rankXHR.responseType = "json";
    rankXHR.send();
    rankXHR.onload = () => {
      const rankSearchResult = document.getElementById("rank_search_result");
      rankSearchResult.innerHTML = "";
      let html = "";

      if (rankXHR.response) {
        const ranks = rankXHR.response.rankKeyword;
        ranks.forEach((rank) => {
          html += `<div class="code_child" id="${rank.name}">` + rank.code + "：" + rank.name + "</div>";
        });
        rankSearchResult.innerHTML = html;

        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById("rank_form").value = codeChild.innerHTML.split("：")[0];
          });
        });

        inputRankForm.addEventListener("blur", () => {
          rankSearchResult.innerHTML = "";
        });
      };
    };
  });
};

// 部屋タイプフォームに入力があった際に予測変換を表示する処理
function roomTypeSearch() {
  const inputRoomTypeForm = document.getElementById("room_type_form");
  inputRoomTypeForm.addEventListener("keyup", () => {
    const roomTypeKeyword = document.getElementById("room_type_form").value;
    
    const roomTypeXHR = new XMLHttpRequest();
    roomTypeXHR.open("GET", `/gests/code/search/room_type/?roomTypeKeyword=${roomTypeKeyword}`, true);
    roomTypeXHR.responseType = "json";
    roomTypeXHR.send();
    roomTypeXHR.onload = () => {
      const roomTypeSearchResult = document.getElementById("room_type_search_result");
      roomTypeSearchResult.innerHTML = "";
      let html = "";

      if (roomTypeXHR.response) {
        const roomTypes = roomTypeXHR.response.roomTypeKeyword;
        roomTypes.forEach((roomType) => {
          html += `<div class="code_child" id="${roomType.name}">` + roomType.code + "：" + roomType.name + "</div>";
        });
        roomTypeSearchResult.innerHTML = html;

        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById("room_type_form").value = codeChild.innerHTML.split("：")[0];
          });
        });

        inputRoomTypeForm.addEventListener("blur", () => {
          roomTypeSearchResult.innerHTML = "";
        });
      };
    };
  });
};

// 地域フォームに入力があった際に予測変換を表示する処理
function areaSearch() {
  const inputAreaForm = document.getElementById("area_form");
  inputAreaForm.addEventListener("keyup", () => {
    const areaKeyword = document.getElementById("area_form").value;
    
    const areaXHR = new XMLHttpRequest();
    areaXHR.open("GET", `/gests/code/search/area/?areaKeyword=${areaKeyword}`, true);
    areaXHR.responseType = "json";
    areaXHR.send();
    areaXHR.onload = () => {
      const areaSearchResult = document.getElementById("area_search_result");
      areaSearchResult.innerHTML = "";
      let html = "";

      if (areaXHR.response) {
        const areas = areaXHR.response.areaKeyword;
        areas.forEach((area) => {
          html += `<div class="code_child" id="${area.name}">` + area.code + "：" + area.name + "</div>";
        });
        areaSearchResult.innerHTML = html;

        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById("area_form").value = codeChild.innerHTML.split("：")[0];
          });
        });

        inputAreaForm.addEventListener("blur", () => {
          areaSearchResult.innerHTML = "";
        });
      };
    };
  });
};

// リクエストフォームに入力があった際に予測変換を表示する処理
function tagSearch(i) {
  const num = i
  const tagForm = "gest_tag" + String(num) + "_code"

  const inputTagForm = document.getElementById(tagForm);
  inputTagForm.addEventListener("keyup", () => {
    const tagKeyword = document.getElementById(tagForm).value;

    const tagXHR = new XMLHttpRequest();
    tagXHR.open("GET", `/gests/code/search/tag/?tagKeyword=${tagKeyword}`, true);
    tagXHR.responseType = "json";
    tagXHR.send();
    tagXHR.onload = () => {
      const resultPlace = "tag_search_result" + String(num)
      const tagSearchResult = document.getElementById(resultPlace);
      tagSearchResult.innerHTML = "";
      let html = "";

      if (tagXHR.response) {
        const tags = tagXHR.response.tagKeyword;
        tags.forEach((tag) => {
          html += `<div class="code_child" id="${tag.name}">` + tag.code + "：" + tag.name + "</div>";
        });
        tagSearchResult.innerHTML = html;

        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById(tagForm).value = codeChild.innerHTML.split("：")[0];
          });
        });

        inputTagForm.addEventListener("blur", () => {
          tagSearchResult.innerHTML = "";
        });
      };
    };
  });
};

// プランフォームに入力があった際に予測変換を表示する処理
function planSearch() {
  const inputPlanForm = document.getElementById("plan_form");
  inputPlanForm.addEventListener("input", () => {
    const planKeyword = document.getElementById("plan_form").value;

    const planXHR = new XMLHttpRequest();
    planXHR.open("GET", `/gests/code/search/plan/?planKeyword=${planKeyword}`, true);
    planXHR.responseType = "json";
    planXHR.send();
    planXHR.onload = () => {
      const planSearchResult = document.getElementById("plan_search_result");
      planSearchResult.innerHTML = "";
      let html = "";

      if (planXHR.response) {
        const plans = planXHR.response.planKeyword;
        plans.forEach((plan) => {
          html += `<div class="code_child" id="${plan.name}">` + plan.code + "：" + plan.name + "</div>";
        });
        planSearchResult.innerHTML = html;

        const codeChildren = Array.from(document.getElementsByClassName("code_child"));
        codeChildren.forEach((codeChild) => {
          codeChild.addEventListener("mousedown", () => {
            document.getElementById("plan_form").value = codeChild.innerHTML.split("：")[0];
          });
        });

        inputPlanForm.addEventListener("blur", () => {
          planSearchResult.innerHTML = "";
        });
      };
    };
  });
};

const regexShowURL = /gests(?=\/\d)/;
if (location.pathname.match("gests/new") || location.pathname.match(regexShowURL)) {
  window.addEventListener("load", () => {
    sexSearch();
    rankSearch();
    roomTypeSearch();
    areaSearch();
    for (let i = 0; i <= 4; i++ ) { tagSearch(i); };
    planSearch();
  });
};

if (location.pathname.match("/gests/search")){
  window.addEventListener("load", () => {
    roomTypeSearch();
    planSearch();
  });
};
