import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Air Max',
      price: '236',
      imagePath: 'lib/images/1.png',
      description: 'The traditional Nike shoe',
    ),
    Shoe(
      name: 'Nike Superfly',
      price: '220',
      imagePath: 'lib/images/2.png',
      description: 'The perfect running shoe',
    ),
    Shoe(
      name: 'Nike E-Series AD',
      price: '240',
      imagePath: 'lib/images/3.png',
      description: 'Everyday comfort gets a modern look',
    ),
    Shoe(
      name: 'Nike Air Max AP',
      price: '190',
      imagePath: 'lib/images/4.png',
      description: 'First class, and in comfort.',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoesList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
