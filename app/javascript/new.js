function pullDown() {

  const sellPrice = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitDom = document.getElementById("profit")

  sellPrice.addEventListener("input", () => {
    const Price = document.getElementById("item-price”).getAttribute('sell-yen').;
    console.log(Price)
  })
}
  
window.addEventListener('load', pullDown)