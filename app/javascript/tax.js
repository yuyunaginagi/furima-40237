function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const consumptionTax = Math.floor(itemPrice.value*0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${consumptionTax}`
    const salesProfit = Math.floor(itemPrice.value*0.9);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit}`
  });
};
window.addEventListener('turbo:load', tax);

