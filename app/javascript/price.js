window.addEventListener("load", function(){

const item_price = document.getElementById('item-price');
let add_tax_price = document.getElementById('add-tax-price');
let profit = document.getElementById('profit');

item_price.addEventListener('input', function(){
  const test = document.getElementById('item-price').value;
  add_tax_price.innerHTML = (test*0.1);
  profit.innerHTML = (test*0.9);
})
})