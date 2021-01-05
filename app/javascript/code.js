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
    sexXHR.open("GET", `code/search/sex/?sexKeyword=${sexKeyword}`, true);
    sexXHR.responseType = "json";
    sexXHR.send();
    sexXHR.onload = () => {
      // 予測変換の表示場所を取得
      const sexSearchResult = document.getElementById("sex_search_result");
      // 文字列が変わるたびに前回の検索結果をリセット
      sexSearchResult.innerHTML = "";
      // レスポンスデータがある場合に処理を実行
      if (sexXHR.response) {
        // 返却された配列データを変数に定義
        const sexes = sexXHR.response.sexKeyword;
        // 返却された配列データの変数から取り出し
        sexes.forEach((sex) => {
          // 表示させるための要素を作成
          const sexChildElement = document.createElement("div");
          // 作成した要素に属性を追加
          sexChildElement.setAttribute("class", "code_child");
          sexChildElement.setAttribute("id", sex.name);
          // 作成した要素に文字列を挿入
          sexChildElement.innerHTML = sex.code + "：" + sex.name;
          // 作成した要素を表示場所に挿入
          sexSearchResult.appendChild(sexChildElement);
          // 予測変換をクリックするとクリックしたコードを入力される
          const clickElement = document.getElementById(sex.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById("sex_form").value = sex.code;
          });
          // 入力フォームからフォーカスが外れると予測変換が消えるように設定
          inputSexForm.addEventListener("blur", () => {
            sexSearchResult.innerHTML = "";
          });
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
    rankXHR.open("GET", `code/search/rank/?rankKeyword=${rankKeyword}`, true);
    rankXHR.responseType = "json";
    rankXHR.send();
    rankXHR.onload = () => {
      const rankSearchResult = document.getElementById("rank_search_result");
      rankSearchResult.innerHTML = "";
      if (rankXHR.response) {
        const ranks = rankXHR.response.rankKeyword;
        ranks.forEach((rank) => {
          const rankChildElement = document.createElement("div");
          rankChildElement.setAttribute("class", "code_child");
          rankChildElement.setAttribute("id", rank.name);
          rankChildElement.innerHTML = rank.code + "：" + rank.name;
          rankSearchResult.appendChild(rankChildElement);

          const clickElement = document.getElementById(rank.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById("rank_form").value = rank.code;
          });
        });
      };
      inputRankForm.addEventListener("blur", () => {
        rankSearchResult.innerHTML = "";
      });
    };
  });
};

// 部屋タイプフォームに入力があった際に予測変換を表示する処理
function roomTypeSearch() {
  const inputRoomTypeForm = document.getElementById("room_type_form");
  inputRoomTypeForm.addEventListener("keyup", () => {
    const roomTypeKeyword = document.getElementById("room_type_form").value;
    
    const roomTypeXHR = new XMLHttpRequest();
    roomTypeXHR.open("GET", `code/search/room_type/?roomTypeKeyword=${roomTypeKeyword}`, true);
    roomTypeXHR.responseType = "json";
    roomTypeXHR.send();
    roomTypeXHR.onload = () => {
      const roomTypeSearchResult = document.getElementById("room_type_search_result");
      roomTypeSearchResult.innerHTML = "";
      if (roomTypeXHR.response) {
        const roomTypes = roomTypeXHR.response.roomTypeKeyword;
        roomTypes.forEach((roomType) => {
          const roomTypeChildElement = document.createElement("div");
          roomTypeChildElement.setAttribute("class", "code_child");
          roomTypeChildElement.setAttribute("id", roomType.name);
          roomTypeChildElement.innerHTML = roomType.code + "：" + roomType.name;
          roomTypeSearchResult.appendChild(roomTypeChildElement);

          const clickElement = document.getElementById(roomType.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById("room_type_form").value = roomType.code;
          });
        });
      };
      inputRoomTypeForm.addEventListener("blur", () => {
        roomTypeSearchResult.innerHTML = "";
      });
    };
  });
};

// 地域フォームに入力があった際に予測変換を表示する処理
function areaSearch() {
  const inputAreaForm = document.getElementById("area_form");
  inputAreaForm.addEventListener("keyup", () => {
    const areaKeyword = document.getElementById("area_form").value;
    
    const areaXHR = new XMLHttpRequest();
    areaXHR.open("GET", `code/search/area/?areaKeyword=${areaKeyword}`, true);
    areaXHR.responseType = "json";
    areaXHR.send();
    areaXHR.onload = () => {
      const areaSearchResult = document.getElementById("area_search_result");
      areaSearchResult.innerHTML = "";
      if (areaXHR.response) {
        const areas = areaXHR.response.areaKeyword;
        areas.forEach((area) => {
          const areaChildElement = document.createElement("div");
          areaChildElement.setAttribute("class", "code_child");
          areaChildElement.setAttribute("id", area.name);
          areaChildElement.innerHTML = area.code + "：" + area.name;
          areaSearchResult.appendChild(areaChildElement);

          const clickElement = document.getElementById(area.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById("area_form").value = area.code;
          });
        });
      };
      inputAreaForm.addEventListener("blur", () => {
        areaSearchResult.innerHTML = "";
      });
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
    tagXHR.open("GET", `code/search/tag/?tagKeyword=${tagKeyword}`, true);
    tagXHR.responseType = "json";
    tagXHR.send();
    tagXHR.onload = () => {
      const resultPlace = "tag_search_result" + String(num)
      const tagSearchResult = document.getElementById(resultPlace);
      tagSearchResult.innerHTML = "";
      if (tagXHR.response) {
        const tags = tagXHR.response.tagKeyword;
        tags.forEach((tag) => {
          const tagChildElement = document.createElement("div");
          tagChildElement.setAttribute("class", "code_child");
          tagChildElement.setAttribute("id", tag.name);
          tagChildElement.innerHTML = tag.code + "：" + tag.name;
          tagSearchResult.appendChild(tagChildElement);

          const clickElement = document.getElementById(tag.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById(tagForm).value = tag.code;
          });
        });
      };
      inputTagForm.addEventListener("blur", () => {
        tagSearchResult.innerHTML = "";
      });
    };
  });
};

// プランフォームに入力があった際に予測変換を表示する処理
function planSearch() {
  const inputPlanForm = document.getElementById("plan_form");
  inputPlanForm.addEventListener("keyup", () => {
    const planKeyword = document.getElementById("plan_form").value;
    
    const planXHR = new XMLHttpRequest();
    planXHR.open("GET", `code/search/plan/?planKeyword=${planKeyword}`, true);
    planXHR.responseType = "json";
    planXHR.send();
    planXHR.onload = () => {
      const planSearchResult = document.getElementById("plan_search_result");
      planSearchResult.innerHTML = "";
      if (planXHR.response) {
        const plans = planXHR.response.planKeyword;
        plans.forEach((plan) => {
          const planChildElement = document.createElement("div");
          planChildElement.setAttribute("class", "code_child");
          planChildElement.setAttribute("id", plan.name);
          planChildElement.innerHTML = plan.code + "：" + plan.name;
          planSearchResult.appendChild(planChildElement);

          const clickElement = document.getElementById(plan.name);
          clickElement.addEventListener("mousedown", () => {
            document.getElementById("plan_form").value = plan.code;
          });
        });
      };
      inputPlanForm.addEventListener("blur", () => {
        planSearchResult.innerHTML = "";
      });
    };
  });
};

const regexShowURL = /gests(?=\/\d)/;
if (location.pathname.match("gests/new") || location.pathname.match(regexShowURL)) {
  document.addEventListener("click", () => {
    sexSearch();
    rankSearch();
    roomTypeSearch();
    areaSearch();
    for (let i = 0; i <= 4; i++ ) { tagSearch(i); };
    planSearch();
  });
};
