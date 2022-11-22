import 'package:flutter/widgets.dart';

import '../data/products.dart';
import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  var _categorySelected = 1;
  List<Product> _produtos = products;

  List<Product> get filteredProducts => _produtos
      .where((product) => product.categories.contains(_categorySelected))
      .toList();

  List<Product> get allProducts => _produtos;

  void changeCategoryFilter(int categoryId) {
    _categorySelected = categoryId;
    notifyListeners();
  }

  List<Product> searchResults(String searchName) {
    var resultado = products
        .where((product) =>
            product.name.toLowerCase().contains(searchName.toLowerCase()))
        .toList();
    return resultado;
  }
}
