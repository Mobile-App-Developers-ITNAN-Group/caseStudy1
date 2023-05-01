import 'dart:html';

void main() {
  List<Map<String, dynamic>> cartItems = []; // holds the list of items in cart

  // Get the add-to-cart buttons and add click event listeners to them
  List<Element> addToCartBtns = querySelectorAll('.add-to-cart');
  addToCartBtns.forEach((btn) {
    btn.onClick.listen((event) {
      // Get the data-name and data-price attributes from the button element
      String itemName = btn.dataset['name'];
      double itemPrice = double.parse(btn.dataset['price']);

      // Add the item to the cartItems list
      cartItems.add({
        'name': itemName,
        'price': itemPrice,
      });

      // Update the cart display
      updateCartDisplay(cartItems);
    });
  });
}

// Update the cart display with the current list of cart items
void updateCartDisplay(List<Map<String, dynamic>> cartItems) {
  // Get the cart items list and total price span elements
  Element cartItemsList = querySelector('#cart-items');
  Element totalPriceSpan = querySelector('#total-price');

  // Clear the current contents of the cart items list
  cartItemsList.innerHtml = '';

  // Add each cart item to the cart items list
  double totalPrice = 0;
  cartItems.forEach((item) {
    Element li = LIElement()
      ..text = '${item['name']} - \$${item['price'].toStringAsFixed(2)}';
    cartItemsList.children.add(li);
    totalPrice += item['price'];
  });

  // Update the total price span with the new total price
  totalPriceSpan.text = totalPrice.toStringAsFixed(2);
}
