function pullDown() {
  const sellPrice = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  sellPrice.addEventListener("input", () => {
    const Price = document.getElementById("item-price").value;
    const Dom = Math.floor(Price * 0.1);
    const Profit = Price - Dom
    addTaxDom.innerHTML = Dom
    profitDom.innerHTML = Profit
  })
}
  
window.addEventListener('load', pullDown)