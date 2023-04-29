import 'dart:html';

void main() {
  // Get a reference to the form element
  final form = document.getElementById('posForm');

  // Add a submit event listener to the form
  form.onSubmit.listen((event) {
    event.preventDefault(); // Prevent form submission
    processForm(); // Call the processForm function
  });
}

void processForm() {
  // Get input values
  String name = (document.getElementById('name') as InputElement).value;
  String email = (document.getElementById('email') as InputElement).value;
  String address = (document.getElementById('address') as InputElement).value;

  // Display result
  DivElement result = DivElement()
    ..text = 'Name: $name\nEmail: $email\nAddress: $address';
  document.getElementById('resultContainer').children.clear();
  document.getElementById('resultContainer').children.add(result);
}
