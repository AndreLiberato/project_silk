import 'dart:math';

import 'package:flutter/material.dart';

import '../data/carts.dart';
import '../models/cart_product.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProducts = carts;

  List<CartProduct> get cartProducts => _cartProducts;

  void addProductToCart(Product product, int quantityChange) {
    if (_cartProducts.any((cart) => cart.product == product)) {
      int index = _cartProducts.indexWhere((cart) => cart.product == product);
      _cartProducts.elementAt(index).quantity += quantityChange;
    } else {
      CartProduct productInCart = CartProduct(
          id: Random().nextInt(100).toString(),
          product: product,
          quantity: quantityChange);
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

  double getProductTotalPrice(Product product) {
    CartProduct currentProduct = _cartProducts.firstWhere(
      (cartProduct) => cartProduct.product.id == product.id,
    );
    var value = currentProduct.quantity * product.price;
    return value;
  }

  double getTotalValueOfCartItems() {
    double total = 0.0;
    for (var cartProduct in _cartProducts) {
      total += cartProduct.product.price * cartProduct.quantity;
    }
    return total;
  }
}
