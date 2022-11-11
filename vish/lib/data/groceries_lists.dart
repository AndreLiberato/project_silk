import '../data/products.dart';
import '../models/grocery_list.dart';
import '../models/list_product.dart';

List<GroceryList> groceriesLists = [
  GroceryList(
    id: "597846mnoe",
    name: "Frutas",
    description: "Compra de frutas semanais",
    listProducts: [
      ListProduct(products[0], 10),
      ListProduct(products[1], 5),
      ListProduct(products[3], 8)
    ],
  ),
];
