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
          sexChildElement.setAttribute("class", "sex_child");
          sexChildElement.setAttribute("id", sex.name);
          // 作成した要素に文字列を挿入
          sexChildElement.innerHTML = sex.code + "：" + sex.name;
          // 作成した要素を表示場所に挿入
          sexSearchResult.appendChild(sexChildElement);
          // 予測変換をクリックするとクリックしたコードを入力される
          const clickElement = document.getElementById(sex.name);
          clickElement.addEventListener("click", () => {
            document.getElementById("sex_form").value = sex.code;
          });
          // ページ内のどこかをクリックすると予測変換が消えるように設定
          document.addEventListener("click", () => {
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
          rankChildElement.setAttribute("class", "rank_child");
          rankChildElement.setAttribute("id", rank.name);
          rankChildElement.innerHTML = rank.code + "：" + rank.name;
          rankSearchResult.appendChild(rankChildElement);

          const clickElement = document.getElementById(rank.name);
          clickElement.addEventListener("click", () => {
            document.getElementById("rank_form").value = rank.code;
          });
        });
      };
      document.addEventListener("click", () => {
        rankSearchResult.innerHTML = "";
      });
    };
  });
};

if (location.pathname.match("gests/new")) {
  document.addEventListener("DOMContentLoaded", () => {
    sexSearch();
    rankSearch();
  });
};
