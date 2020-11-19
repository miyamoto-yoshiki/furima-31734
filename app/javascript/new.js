function pullDown() {
  console.log("ok")
  const sellPrice = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitDom = document.getElementById("profit")

  sellPrice.addEventListener("input", () => {
    // const Price = document.getElementById("item-price”).getAttribute('sell-yen').;間違い
    const Price = document.getElementById("item-price").value; //.valueで入力された値を取得している。
    const Dom = Price * 0.1
    const Profit = Price - Dom
    addTaxDom.innerHTML = Dom
    profitDom.innerHTML = Profit
  })
}
  
window.addEventListener('load', pullDown)