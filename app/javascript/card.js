const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // 公開鍵(PublicKey)を設定する
  const form = document.getElementById("charge-form");
  // charge-form内のsubmitが実行されるとイベント発火する
  form.addEventListener("submit", (e) => {
    e.preventDefault();
//  jsでサーバーサイドに値を送る
    const XHR = new XMLHttpRequest();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
// nameから
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
  // 入力された、カード情報を変数に代入します
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      else{
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
//  入力された各カード情報がパラメーターとして送られないように値を削除する
      document.getElementById("charge-form").submit();
      // フォームに記載されている情報をサーバーサイドに送信する
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);