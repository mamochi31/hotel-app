// ライブラリ「moment.js」を使用した日付の計算と自動入力
function date_calc() {
  // フォームの取得
  const arrDateForm = document.getElementById("arr_date_form");
  const depDateForm = document.getElementById("dep_date_form");
  const nightForm = document.getElementById("night _form");
  // 変数の初期化
  let dt = moment();
  let night = 0;

  // 出発日が入力・変更された際の処理
  arrDateForm.addEventListener("input", () => {
    dt = moment(arrDateForm.value);
    night = nightForm.value;
    depDateForm.value = dt.add(night, 'days').format('YYYY-MM-DD');
  });

  // 泊数が入力・変更された際の処理
  nightForm.addEventListener("input", () => {
    dt = moment(arrDateForm.value);
    night = nightForm.value;
    depDateForm.value = dt.add(night, 'days').format('YYYY-MM-DD');
  });
};

// 予約登録画面と予約詳細画面のみで処理を実行
const regexShowURL = /gests(?=\/\d)/;
if (location.pathname.match("gests/new") || location.pathname.match(regexShowURL)) {
  document.addEventListener("click", () => {
    date_calc();
  });
};