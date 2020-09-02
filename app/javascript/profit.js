window.addEventListener('load', function (){
  item_price.addEventListener('click', function() {
    const formData = new FormData(document.getElementById("item-price"));
    const XHR = new XMLHttpRequest();
    XHR.open("GET", "/items/new", true);
    var ip = document.getElementById( "item-price" ).value;
    // 入力した数字をipに代入する
    var tax = Math.round(Math.pow(ip * 0.1)
    // taxに(入力した数字＊0.1手数料)を代入する
    var profit = Math.round(Math.pow(ip * 0.9)

    XHR.responseType = "json";
    XHR.send(formData);
    // 入力したデーターを送る
    XHR.onload = () => {
    // profitに(入力した数字＊0.9販売利益)を代入する
    if (tax > 0){
      // もし計算結果が0より大きいなら計算した値をadd-tax-priceに反映させる
      document.getElementById("add-tax-price").innerHTML = tax; 
    } else {
      document.getElementById("add-tax-price").innerHTML = '';
    }
    if (profit > 0){
      // もし計算結果が0より大きいなら計算した値をprofitに反映させる
      document.getElementById("profit").innerHTML = ; 
    } else {
      document.getElementById("profit").innerHTML = '';
    }
  }

  })

})

// function check() {
//   const prices = document.querySelectorAll(".price-input");
//   prices.forEach(function (price) {
//     price.addEventListener("onKeyUp", () => { 
//     // ここにクリックした時に行う「何らかの処理」を記述していく
//     const priceId = price.getAttribute("data-id");
//     const XHR = new XMLHttpRequest();
//     // XHR.open("GET", `/posts/${postId}`, true);
//     XHR.responseType = "json";
//       XHR.send();
//       // データーを送る


//       XHR.onload = () => {
//         const newitem = XHR.response.post;
//           new.setAttribute();
//         }
//       };

//     });
//   });
// }
// window.addEventListener("load", check);