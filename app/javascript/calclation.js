window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('keyup', function(){
    const itemPriceValue = itemPrice.value
    const tax =  itemPriceValue*0.1
    const afterTax = Math.round(tax)
    const afterProfit = itemPriceValue - afterTax
    addTaxPrice.innerHTML = afterTax
    profit.innerHTML = afterProfit
  })
})