function tax (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    const consumptionTax = Math.floor(inputValue * 0.1);
    addTaxPrice.innerHTML = `${consumptionTax}`;

    const profit = document.getElementById("profit");
    const salesProfit = Math.floor(inputValue * 0.9);
    profit.innerHTML = `${salesProfit}`;
  });
};
window.addEventListener('turbo:load', tax);