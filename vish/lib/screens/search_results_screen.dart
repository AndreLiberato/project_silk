import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/products_list.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchFilter = ModalRoute.of(context)!.settings.arguments as String;
    var products = context.read<ProductsProvider>();
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
      body: products.searchResults(searchFilter).isNotEmpty
          ? ProductsList(true, searchFilter)
          : const Center(
              child: Text(
                "Nenhum produto encontrado!",
                style: TextStyle(
                    color: Colors.black, fontFamily: "Acme", fontSize: 18),
              ),
            ),
    );
  }
}
