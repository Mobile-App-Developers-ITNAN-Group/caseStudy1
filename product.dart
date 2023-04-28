import 'dart:html';

void main() {
  //to add product -> name -> description -> price
  addProduct(
      'Apple',
      'Apples are a good source of dietary fiber, vitamin C, and antioxidants. They are low in calories, making them a popular snack food. Apples can be eaten raw, cooked, or used in a variety of dishes, including pies, cakes, and sauces. They are also used to make juice and cider. The flesh of the apple is often eaten, while the skin and core are discarded. However, some people choose to eat the skin as well, as it contains additional nutrients and fiber. Overall, apples are a healthy and delicious fruit that can be enjoyed in a variety of ways.',
      1.55);
  addProduct(
      'Mango',
      'Mangoes are high in vitamins C and A, fiber, and antioxidants, making them a nutritious addition to a healthy diet. They are often eaten fresh, but can also be used in a variety of dishes, including salads, smoothies, and desserts. Mangoes are also used to make jams, chutneys, and sauces. In many cultures, mangoes hold cultural and symbolic significance, and they are often associated with the start of summer or the harvest season. Overall, mangoes are a delicious and nutritious fruit that is enjoyed by people all over the world.',
      5.11);
  addProduct(
      'Durian',
      'Durian is a rich source of vitamins and minerals, including vitamin C, potassium, and dietary fiber. However, its strong odor and unusual taste make it a divisive fruit, with some people loving it and others finding it repulsive. In some parts of Southeast Asia, durian is considered a delicacy and is often used in local cuisine. It is also used to make ice cream, candy, and other sweet treats. Despite its reputation, many people consider durian to be a unique and delicious fruit that is worth trying at least once.',
      5.15);
  addProduct(
      'Watermelon',
      'Watermelon is a good source of vitamins A and C, as well as the antioxidant lycopene, which has been linked to a reduced risk of certain types of cancer and other health benefits. In addition to its nutritional value, watermelon is also low in calories and fat, making it a popular snack food.',
      5.15);
}

void addProduct(String name, String description, double price) {

  // create fruit
  DivElement product = Element.tag('div') as DivElement;
  product.className = 'product';

  //as an title of the fruit it has to big a bit
  Element productName = Element.tag('h3');
  productName.text = name;
  product.children.add(productName);

  //because it is a description we are using p(paragraph)
  Element productDesc = Element.tag('p');
  productDesc.text = description;
  product.children.add(productDesc);

  Element productPrice = Element.tag('p');
  productPrice.text = 'Price: RM ${price.toStringAsFixed(2)}';
  product.children.add(productPrice);

  // add product to product ID
  DivElement contProduct = querySelector('#product') as DivElement;
  contProduct.children.add(product);
}
