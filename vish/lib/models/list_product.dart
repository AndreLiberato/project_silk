import 'product.dart';

class ListProduct {
  Product product;
  int quantity;

  ListProduct(this.product, this.quantity);

  factory ListProduct.fromJson(Map<String, dynamic> json) {
    return ListProduct(
        Product.fromJson(json["product"]["id"] ?? "", json["product"]),
        json["quantity"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "product": product.toJson(),
      "quantity": quantity,
    };
  }
}
