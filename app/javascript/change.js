function change(){
  const item = document.getElementById("item-price")//入力した値<div>
  const tax = document.getElementById("add-tax-price")//手数料0.1
  const profit = document.getElementById("profit")//利益0.9

  item.addEventListener('keyup', function(){
    itemPrice =  item.value //中身(0)になっている
    tax.innerHTML  = itemPrice * 0.1
    profit.innerHTML = itemPrice * 0.9
  })
}
window.addEventListener('load', change)