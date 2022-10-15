import 'package:flutter/material.dart';
import 'package:vish/models/product.dart';

import '../data/products.dart';
import '../widgets/products_list.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _searchFilter = ModalRoute.of(context)!.settings.arguments as String;
    List<Product> resultProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(_searchFilter.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Resultados",
          style:
              TextStyle(fontSize: 24, fontFamily: "Acme", color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ProductsList(null, resultProducts),
    );
  }
}
