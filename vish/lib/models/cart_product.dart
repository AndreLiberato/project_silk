import 'product.dart';

class CartProduct {
  String id;
  Product product;
  int quantity;

  CartProduct(
      {required this.id, required this.product, required this.quantity});
}
