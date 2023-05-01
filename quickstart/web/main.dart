import 'dart:html';

void main() {
  // Get a reference to all the "Add to Cart" buttons
  List<ButtonElement> buttons = querySelectorAll('button');

  // Add an event listener to each button
  buttons.forEach((button) {
    button.onClick.listen((MouseEvent event) {
      // Add your code here to handle the button click
      print('Button clicked!');
    });
  });
}
