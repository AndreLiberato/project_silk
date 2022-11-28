import '../data/products.dart';
import '../models/grocery_list.dart';
import '../models/list_product.dart';

List<GroceryList> groceriesLists = [
  GroceryList(
      id: "597846mnoe",
      name: "Compras",
      description: "Compras semanais",
      creatorId: "dsd",
      listProducts: [
        ListProduct(products[0], 5),
        ListProduct(products[1], 5),
        ListProduct(products[3], 5),
        ListProduct(products[2], 5),
        ListProduct(products[4], 5),
        ListProduct(products[5], 5),
        ListProduct(products[6], 10),
      ],
      creationDate: DateTime.now(),
      hasAutoPayment: true,
      paymentDate: DateTime.now().add(const Duration(days: 30))),
  GroceryList(
    id: "5978496mnoe",
    name: "Cervejas",
    description: "Compra de cerveja",
    creatorId: "dsd",
    listProducts: [
      ListProduct(products[6], 50),
    ],
    creationDate: DateTime.now(),
  ),
  GroceryList(
      id: "5988496mnoe",
      name: "Grãos",
      description: "Compra de arroz e feijão prax",
      creatorId: "dsd",
      listProducts: [
        ListProduct(products[4], 3),
        ListProduct(products[3], 3),
      ],
      creationDate: DateTime.now(),
      hasAutoPayment: true,
      paymentDate: DateTime.now().add(const Duration(
        days: 12,
      ))),
];
