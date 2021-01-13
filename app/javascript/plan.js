// プランフォームに入力されたコードの詳細情報を表示する機能
function planShowDisplay () {
  // フォームの取得
  const planForm = document.getElementById("plan_form");
  const planName = document.getElementById("plan_name");
  const planUnitPrice = document.getElementById("unit_price");
  const planSumPrice = document.getElementById("sum_price");
  const adult = document.getElementById("adult_form");

  // プランコードを入力した時にプランの情報が入力される処理
  planForm.addEventListener("blur", () => {
    // 入力されたプランコードを取得して非同期通信で送信
    const planCode = planForm.value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `show/plan/?planCode=${planCode}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      // 返却されたデータがあった場合の処理
      if (XHR.response.planCode != null) {
        // 返却されたデータをHTMlに反映
        const plan = XHR.response.planCode;
        planName.innerHTML = plan.name;
        planUnitPrice.innerHTML = plan.price + "円";
        if (adult.value != "") {
          planSumPrice.innerHTML = plan.price * adult.value + "円";
        } else {
          planSumPrice.innerHTML = plan.price + "円";
        };
      };
    };
  });

  // プランを入力した後に、人数が入力・変更された時の処理
  adult.addEventListener("input", () => {
    if (planSumPrice.innerHTML != "") {
      planSumPrice.innerHTML = parseFloat(planUnitPrice.innerHTML) * adult.value + "円";
    };
  });
};

// 予約登録画面と予約詳細画面のみで処理を実行
const regexShowURL = /gests(?=\/\d)/;
if (location.pathname.match("gests/new") || location.pathname.match(regexShowURL)) {
  document.addEventListener("click", () => {
    planShowDisplay();
  });
};