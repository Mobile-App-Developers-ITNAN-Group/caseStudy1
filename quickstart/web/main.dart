import 'dart:html';
import 'dart:math';

List<Map<String, dynamic>> cart = [];

void addToCart(String name, double price) {
  int quantity = 1;

  Element li = LIElement();
  Element nameElement = SpanElement();
  Element priceElement = SpanElement();
  InputElement quantityInput = InputElement();
  ButtonElement decreaseButton = ButtonElement();
  ButtonElement increaseButton = ButtonElement();

  nameElement.text = name;
  priceElement.text = '\$${price.toStringAsFixed(2)}';
  quantityInput.type = 'number';
  quantityInput.min = '1';
  quantityInput.max = '99';
  quantityInput.value = quantity.toString();
  decreaseButton.text = '-';
  increaseButton.text = '+';

  li.append(nameElement);
  li.append(priceElement);
  li.append(quantityInput);
  li.append(decreaseButton);
  li.append(increaseButton);

  final cartList = querySelector('#cart');
  cartList?.append(li);

  cart.add({'name': name, 'price': price, 'quantity': quantity});

  double total = cart.fold<double>(
      0, (acc, item) => acc + (item['price'] * item['quantity']));
  double taxRate = 0.6; // example tax rate of 60%
  double tax = total * taxRate;
  double discountRate = 0.1; // example discount rate of 10%
  double discount = updateDiscount();
  double superTotal = total + tax - discount;
  final checkoutButton = querySelector('#checkout-button');
  checkoutButton?.onClick.listen((event) {
    updateSuperTotal();
  });

  querySelector('#total')?.text = '\$${total.toStringAsFixed(2)}';
  querySelector('#tax')?.text = '\$${tax.toStringAsFixed(2)}';
}

void updateSuperTotal() {
  updateDiscount();
  double total = cart.fold<double>(
      0, (acc, item) => acc + (item['price'] * item['quantity']));
  double taxRate = 0.6; // example tax rate of 60%
  double tax = total * taxRate;
  double discount = updateDiscount();
  double superTotal = total + tax - discount;
  querySelector('#superTotal')?.text = '\$${superTotal.toStringAsFixed(2)}';
}

double updateDiscount() {
  double total = cart.fold<double>(
      0, (acc, item) => acc + (item['price'] * item['quantity']));
  double discount = total >= 50
      ? total * 0.1
      : 0; // apply 10% discount if total is greater than or equal to 50
  double discountedTotal = total - discount;
  querySelector('#discount')?.text = '\$${discount.toStringAsFixed(2)}';
  querySelector('#total')?.text = '\$${discountedTotal.toStringAsFixed(2)}';
  return discount;
}

void updateTotal() {
  double total = cart.fold<double>(
      0, (acc, item) => acc + (item['price'] * item['quantity']));
  querySelector('#total')?.text = '\$${total.toStringAsFixed(2)}';
  updateTax();
}

void updateTax() {
  double total = cart.fold<double>(
      0, (acc, item) => acc + (item['price'] * item['quantity']));
  double taxRate = 0.6; // example tax rate of 60%
  double tax = total * taxRate;
  querySelector('#tax')?.text = '\$${tax.toStringAsFixed(2)}';
}

void main() {
  final decreaseButton = querySelector('#decrease-button');
  final increaseButton = querySelector('#increase-button');
  final quantityInput = querySelector('#quantity-input');
  final cart = []; // assuming cart is a global variable
  // var quantity = int.parse(quantityInput.value);

  // decreaseButton?.onClick.listen((event) {
  //   if (quantity > 0) {
  //     quantity--;
  //     quantityInput.value = quantity.toString();
  //     cart.firstWhere((item) => item['name'] == name)['quantity'] = quantity;
  //     updateTotal();
  //   }
  // });

  // increaseButton?.onClick.listen((event) {
  //   quantity++;
  //   quantityInput.value = quantity.toString();
  //   cart.firstWhere((item) => item['name'] == name)['quantity'] = quantity;
  //   updateTotal();
  // });

  // Hide the clicked button after it is clicked
  void hideButton(Event event) {
    (event.target as ButtonElement).style.display = 'none';
  }

  generateRandomNumber() {
    // Generate a random number between 1 and 100
    var randomNumber = 1 + Random().nextInt(1999999999);

    // Update the text in the HTML element with the new random number
    querySelector('#random-number')?.text = randomNumber.toString();
  }

  var today = DateTime.now();
  // var options = DateTimeFormat('en_US').add_yMMMMd().add_EEEE();
  // querySelector('#current-date')?.text =
  //     'Today is ${DateFormat(options).format(today)}';
}
