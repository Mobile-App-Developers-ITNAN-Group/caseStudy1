let cart = [];

function addToCart(name, price) {
  let quantity = 1;

  let li = document.createElement("li");
  let nameElement = document.createElement("span");
  let priceElement = document.createElement("span");
  let quantityInput = document.createElement("input");
  let decreaseButton = document.createElement("button");
  let increaseButton = document.createElement("button");

  nameElement.innerText = name;
  priceElement.innerText = `$${price.toFixed(2)}`;
  quantityInput.type = "number";
  quantityInput.min = "1";
  quantityInput.max = "99";
  quantityInput.value = quantity;
  decreaseButton.innerHTML = "-";
  increaseButton.innerHTML = "+";

  li.appendChild(nameElement);
  li.appendChild(priceElement);
  li.appendChild(quantityInput);
  li.appendChild(decreaseButton);
  li.appendChild(increaseButton);

  let cartList = document.getElementById("cart");
  cartList.appendChild(li);

  cart.push({ name, price, quantity });

  let total = cart.reduce((acc, item) => acc + (item.price * item.quantity), 0);
  let taxRate = 0.6; // example tax rate of 60%
  let tax = total * taxRate;
  let discountRate = 0.1; // example discount rate of 10%
  let discount = updateDiscount();
  let superTotal = total + tax - discount;
  let checkoutButton = document.getElementById("checkout-button");
checkoutButton.addEventListener("click", function() {
  updateSuperTotal();
});

document.getElementById("total").innerText = `$${total.toFixed(2)}`;
document.getElementById("tax").innerText = `$${tax.toFixed(2)}`;

function updateSuperTotal() {
    updateDiscount(); // call the updateDiscount function to calculate the latest discount
    let superTotal = total + tax - discount; // calculate the super total using the updated values of total, tax and discount
    document.getElementById("superTotal").innerText = `$${superTotal.toFixed(2)}`; // update the super total displayed on the webpage
  }
  

function updateDiscount() {
    let total = cart.reduce((acc, item) => acc + (item.price * item.quantity), 0);
    let discount = total >= 50 ? total * 0.1 : 0; // apply 10% discount if total is greater than or equal to 50
    let discountedTotal = total - discount;
    document.getElementById("discount").innerText = `$${discount.toFixed(2)}`;
    document.getElementById("total").innerText = `$${discountedTotal.toFixed(2)}`;
  }
  
  

function updateTotal() {
  total = cart.reduce((acc, item) => acc + (item.price * item.quantity ), 0);
  document.getElementById("total").innerText = `$${total.toFixed(2)}`;
  updateTax(); // call the updateTax function whenever the total is updated
}

function updateTax() {
  tax = total * taxRate;
  document.getElementById("tax").innerText = `$${tax.toFixed(2)}`;
}

  decreaseButton.addEventListener("click", () => {
    if (quantity > 0) {
      quantity--;
      quantityInput.value = quantity;
      cart.find((item) => item.name === name).quantity = quantity;
      updateTotal();
    }
  });

  increaseButton.addEventListener("click", () => {
    quantity++;
    quantityInput.value = quantity;
    cart.find((item) => item.name === name).quantity = quantity;
    updateTotal();
  });
  // Hide the clicked button after it is clicked
  event.target.style.display = "none";
}

  function generateRandomNumber() {
    // Generate a random number between 1 and 100
    var randomNumber = Math.floor(Math.random() * 1999999999) + 1;
    
    // Update the text in the HTML element with the new random number
    document.getElementById("random-number").innerHTML = randomNumber;
  }
  var today = new Date();
      var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
      document.getElementById("current-date").innerHTML = "Today is " + today.toLocaleDateString('en-US', options);


       