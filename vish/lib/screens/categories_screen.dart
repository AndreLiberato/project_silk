import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/categories.dart';
import '../providers/products_provider.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            "Categorias",
            style: TextStyle(
                fontSize: 24, fontFamily: "Acme", color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1),
          itemBuilder: ((context, index) => InkWell(
              child: CategoryItem(categories[index]),
              onTap: () {
                Provider.of<ProductsProvider>(context, listen: false)
                    .changeCategoryFilter(categories[index].id);
                Navigator.of(context).pushNamed("/categoria-produtos");
              })),
        ));
  }
}
