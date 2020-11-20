function pullDown() {
  const sellPrice = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  sellPrice.addEventListener("input", () => {
    const Price = document.getElementById("item-price").value;
    const Tax = Math.floor(Price * 0.1);
    const Profit = Price - Tax
    addTaxDom.innerHTML = Tax
    profitDom.innerHTML = Profit
  })
}
  
window.addEventListener('load', pullDown)