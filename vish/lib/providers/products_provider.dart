import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  var _categorySelected = 1;
  final List<Product> _products = [];

  List<Product> get filteredProducts => _products
      .where((product) => product.categories.contains(_categorySelected))
      .toList();

  List<Product> get allProducts => _products;

  Future fetchProducts() async {
    try {
      if (_products.isNotEmpty) {
        _products.clear();
      }
      await FirebaseFirestore.instance
          .collection("products")
          .get()
          .then((snapshot) => snapshot.docs.forEach((document) {
                _products.add(Product.fromJson(document.id, document.data()));
              }));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void changeCategoryFilter(int categoryId) {
    _categorySelected = categoryId;
    notifyListeners();
  }

  List<Product> searchResults(String searchName) {
    var resultado = _products
        .where((product) =>
            product.name.toLowerCase().contains(searchName.toLowerCase()))
        .toList();
    return resultado;
  }
}
