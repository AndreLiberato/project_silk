import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_item.dart';

class ProductsList extends StatelessWidget {
  final int? _categoryFilter;
  final List<Product> products;

  ProductsList(this._categoryFilter, this.products);

  late List<Product> _filteredProducts;

  @override
  Widget build(BuildContext context) {
    _categoryFilter != null
        ? _filteredProducts = products
            .where(
              (product) => product.categories.contains(_categoryFilter),
            )
            .toList()
        : _filteredProducts = products;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: GridView.builder(
        itemCount: _filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 150 / 171,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: ((context, index) =>
            ProductItem(_filteredProducts[index])),
      ),
    );
  }
}
