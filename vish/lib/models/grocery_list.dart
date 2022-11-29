import 'list_product.dart';

class GroceryList {
  String id;
  String name;
  String creatorId;
  String description;
  DateTime creationDate = DateTime.now();
  DateTime? paymentDate;
  double totalValue;
  List<ListProduct> listProducts;
  bool hasAutoPayment;

  GroceryList(
      {required this.name,
      required this.id,
      required this.creatorId,
      required this.description,
      required this.creationDate,
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

  factory GroceryList.fromJson(String id, Map<String, dynamic> json) {
    List<ListProduct> listProductsData = [];

    if (json["listProducts"].isNotEmpty) {
      for (var listProduct in json["listProducts"]) {
        listProductsData.add(ListProduct.fromJson(listProduct));
      }
    }

    var groceryList = GroceryList(
      name: json["name"],
      id: id,
      creatorId: json["creatorId"],
      description: json["description"],
      creationDate: DateTime.parse(json["creationDate"].toDate().toString()),
      paymentDate: json["paymentDate"] != null
          ? DateTime.parse(json["paymentDate"].toDate().toString())
          : null,
      hasAutoPayment: json["hasAutoPayment"],
      totalValue: json["totalValue"],
      listProducts: List<ListProduct>.from(listProductsData),
    );

    return groceryList;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "creationDate": DateTime.now(),
      "hasAutoPayment": hasAutoPayment,
      "paymentDate": paymentDate,
      "totalValue": totalValue,
      "listProducts":
          listProducts.map((listProduct) => listProduct.toJson()).toList(),
      "creatorId": creatorId,
    };
  }
}
