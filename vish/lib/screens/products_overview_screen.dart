import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/my_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/categories_list.dart';
import '../widgets/products_list.dart';
import '../widgets/search_input.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  void initState() {
    super.initState();
    var productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    if (productsProvider.allProducts.isEmpty) {
      productsProvider.fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VISH",
          style: TextStyle(
              shadows: [Shadow(color: Colors.black26, offset: Offset(1, 3))],
              color: Color(0xFFf65c05),
              fontFamily: "Cherry Bomb",
              fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey, size: 24),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ))
        ],
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        edgeOffset: 50,
        displacement: 0,
        onRefresh: () => Provider.of<ProductsProvider>(context, listen: false)
            .fetchProducts(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: SearchInput()),
            const SizedBox(
              height: 10,
            ),
            CategoriesList(),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                "Produtos",
                style: TextStyle(
                    fontSize: 24, color: Colors.black, fontFamily: "Acme"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ProductsList(
              false,
            )),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
