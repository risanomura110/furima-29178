function change(){
  const item = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  item.addEventListener('keyup', function(){
    itemPrice =  item.value
    tax.innerHTML  = itemPrice * 0.1
    profit.innerHTML = itemPrice * 0.9
  })
}
window.addEventListener('load', change)