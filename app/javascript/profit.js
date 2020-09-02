function check() {
  const prices = document.querySelectorAll(".price-input");
  prices.forEach(function (price) {
    price.addEventListener("onKeyUp", () => { 
    // ここにクリックした時に行う「何らかの処理」を記述していく
    const priceId = price.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    // XHR.open("GET", `/posts/${postId}`, true);
    XHR.responseType = "json";
      XHR.send();
      // データーを送る


      XHR.onload = () => {
        const newitem = XHR.response.post;
          new.setAttribute();
        }
      };

    });
  });
}
window.addEventListener("load", check);