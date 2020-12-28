// 性別フォームに入力があった際に予測変換を表示する処理
function sexSearch() {
  const inputSexForm = document.getElementById("sex_form");
  inputSexForm.addEventListener("keyup", () => {
    const sexKeyword = document.getElementById("sex_form").value;
    
    const sexXHR = new XMLHttpRequest();
    sexXHR.open("GET", `code/search/sex/?sexKeyword=${sexKeyword}`, true);
    sexXHR.responseType = "json";
    sexXHR.send();
    sexXHR.onload = () => {
      const sexSearchResult = document.getElementById("sex_search_result");
      sexSearchResult.innerHTML = "";
      if (sexXHR.response) {
        const sexes = sexXHR.response.sexKeyword;
        sexes.forEach((sex) => {
          const sexChildElement = document.createElement("div");
          sexChildElement.setAttribute("class", "sex_child");
          sexChildElement.setAttribute("id", sex.name);
          sexChildElement.innerHTML = sex.code + "：" + sex.name;
          sexSearchResult.appendChild(sexChildElement);

          const clickElement = document.getElementById(sex.name);
          clickElement.addEventListener("click", () => {
            document.getElementById("sex_form").value = sex.code;
            clickElement.remove();
          });
        });
      };
      inputSexForm.addEventListener("blur", () => {
        sexSearchResult.remove();
      });
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
            clickElement.remove();
          });
        });
      };
      inputRankForm.addEventListener("blur", () => {
        rankSearchResult.remove();
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
