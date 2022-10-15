import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import 'product_item.dart';

class ProductsList extends StatelessWidget {
  final _categoryFilter;

  ProductsList(this._categoryFilter);

  late List<Product> _filteredProducts;

  @override
  Widget build(BuildContext context) {
    _filteredProducts = products
        .where(
          (product) => product.categories.contains(_categoryFilter),
        )
        .toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Text(
          "Produtos",
          style:
              TextStyle(fontSize: 24, color: Colors.black, fontFamily: "Acme"),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: GridView.builder(
                itemCount: _filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 150 / 171,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: ((context, index) =>
                    ProductItem(_filteredProducts[index])))),
      ),
    ]);
  }
}
