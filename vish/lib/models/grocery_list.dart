import 'list_product.dart';

class GroceryList {
  String id;
  String name;
  String description;
  DateTime creationDate = DateTime.now();
  DateTime? paymentDate;
  double totalValue;
  List<ListProduct> listProducts;
  bool hasAutoPayment;

  GroceryList(
      {required this.name,
      required this.id,
      this.description = "",
      this.totalValue = 0.0,
      this.listProducts = const [],
      this.paymentDate,
      this.hasAutoPayment = false});

  double getTotalValue() {
    totalValue = 0.0;
    for (ListProduct listProduct in listProducts) {
      totalValue += listProduct.quantity * listProduct.product.price;
    }
    return totalValue;
  }
}
