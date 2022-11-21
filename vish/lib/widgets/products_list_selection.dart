import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';
import 'products_selector.dart';

class ProductsListSelection extends StatefulWidget {
  List<Product> _products;
  Function _updateProductsInList;

  ProductsListSelection(this._products, this._updateProductsInList);

  @override
  State<ProductsListSelection> createState() => _ProductsListSelectionState();
}

class _ProductsListSelectionState extends State<ProductsListSelection> {
  final _searchController = TextEditingController();
  late List<Product> _allProducts;
  late List<Product> _filteredProducts;
  List<Product> _selectedProducts = [];

  void updateSelectedProducts() {
    for (var productInList in widget._products) {
      _selectedProducts.add(productInList);
    }
  }

  @override
  void initState() {
    super.initState();
    _allProducts =
        Provider.of<ProductsProvider>(context, listen: false).allProducts;
    _filteredProducts = _allProducts;
    if (widget._products.isNotEmpty) {
      updateSelectedProducts();
    }
  }

  void _addSelectedProductsToList(List<Product> selectedProducts) {
    _selectedProducts = selectedProducts;
  }

  void _submitProducts() {
    widget._updateProductsInList(_selectedProducts);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 320,
              height: 45,
              child: Material(
                shadowColor: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                elevation: 3,
                child: TextField(
                  controller: _searchController,
                  cursorColor: Colors.black26,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                  onChanged: (searchFilter) {
                    setState(() {
                      if (searchFilter.isNotEmpty) {
                        _filteredProducts = _allProducts
                            .where((product) => product.name
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))
                            .toList();
                      } else {
                        _filteredProducts = _allProducts;
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Procurar produtos",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 16,
                      color: Colors.black38,
                    ),
                    fillColor: Colors.black12,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () => _submitProducts(),
                icon: const Icon(Icons.save))
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
          child: ProductsSelector(_filteredProducts, _selectedProducts,
              _addSelectedProductsToList)),
    ]);
  }
}
