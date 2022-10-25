import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vish/data/products.dart';

import '../models/product.dart';
import '/providers/products_provider.dart';
import 'product_item.dart';

class ProductsList extends StatelessWidget {
  final bool _isSearching;
  String? searchFilter;

  ProductsList(this._isSearching, [this.searchFilter]);
  @override
  Widget build(BuildContext context) {
    List<Product> resultadoPesquisa = [];
    if (_isSearching) {
      resultadoPesquisa =
          context.read<ProductsProvider>().searchResults(searchFilter!);
    }
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Consumer<ProductsProvider>(
          builder: (_, products, __) => GridView.builder(
            itemCount: _isSearching
                ? resultadoPesquisa.length
                : products.filteredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 150 / 171,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: ((context, index) => InkWell(
                  child: Hero(
                    tag: _isSearching
                        ? resultadoPesquisa[index].id
                        : products.filteredProducts[index].id,
                    child: ProductItem(_isSearching
                        ? resultadoPesquisa[index]
                        : products.filteredProducts[index]),
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                      "/detalhe-produto",
                      arguments: _isSearching
                          ? resultadoPesquisa[index]
                          : products.filteredProducts[index]),
                )),
          ),
        ));
  }
}
