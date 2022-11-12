import 'dart:math';

import 'package:flutter/material.dart';

import '../data/carts.dart';
import '../models/cart_product.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProducts = carts;

  List<CartProduct> get cartProducts => _cartProducts;

  void addProductToCart(Product product) {
    if (_cartProducts.any((cart) => cart.product == product)) {
      int index = _cartProducts.indexWhere((cart) => cart.product == product);
      _cartProducts.elementAt(index).quantity++;
    } else {
      CartProduct productInCart = CartProduct(
          id: Random().nextInt(100).toString(), product: product, quantity: 1);
      _cartProducts.add(productInCart);
    }
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    CartProduct productInCart =
        _cartProducts.firstWhere((cart) => cart.product == product);
    _cartProducts.remove(productInCart);
    notifyListeners();
  }

  void changeProductQuantity(CartProduct product, int delta) {
    CartProduct currentProduct = _cartProducts.firstWhere(
      (cartProduct) => cartProduct.id == product.id,
    );
    int index = _cartProducts.indexOf(product);

    currentProduct.quantity += delta;

    _cartProducts[index] = product;
    notifyListeners();
  }

  double getTotalValueOfCartItems() {
    double total = 0.0;
    for (var cartProduct in _cartProducts) {
      total += cartProduct.product.price * cartProduct.quantity;
    }
    return total;
  }
}
