import 'package:flutter/material.dart';
import 'package:vish/widgets/product_item.dart';

import '../models/product.dart';
import '/widgets/search_input.dart';

final List<Product> products = [
  Product(
      description:
          "Maçã gala nacional, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "1",
      name: "Maçã Gala Nacional",
      measure: "1Kg",
      imageUrl:
          "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/maca-gala1-1e5fb8f95f2e6d251a15221697061927-1024-1024.jpg",
      price: 4.99),
  Product(
      description:
          "Banana prata, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "2",
      name: "Banana Prata",
      measure: "1Kg",
      imageUrl:
          "https://ceagesp.gov.br/wp-content/uploads/2019/12/Banana_pratapng.png",
      price: 3.99),
  Product(
      description:
          "Uva sem semente, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "3",
      name: "Uva sem semente",
      measure: "1Kg",
      imageUrl:
          "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/uva-brs-isis-sem-semente1-4117fb3e4898b50a5a16102264065112-1024-1024.jpg",
      price: 7.99),
  Product(
      description:
          "Maçã gala nacional, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "1",
      name: "Maçã Gala Nacional",
      measure: "1Kg",
      imageUrl:
          "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/maca-gala1-1e5fb8f95f2e6d251a15221697061927-1024-1024.jpg",
      price: 4.99),
  Product(
      description:
          "Banana prata, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "2",
      name: "Banana Prata",
      measure: "1Kg",
      imageUrl:
          "https://ceagesp.gov.br/wp-content/uploads/2019/12/Banana_pratapng.png",
      price: 3.99),
  Product(
      description:
          "Uva sem semente, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "3",
      name: "Uva sem semente",
      measure: "1Kg",
      imageUrl:
          "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/uva-brs-isis-sem-semente1-4117fb3e4898b50a5a16102264065112-1024-1024.jpg",
      price: 7.99),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VISH", style: Theme.of(context).textTheme.headline4),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 24,
                color: Colors.grey,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: SearchInput()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categorias",
                  style: TextStyle(
                      fontSize: 24, color: Colors.black, fontFamily: "Acme"),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Mostrar todas",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ))),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
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
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemBuilder: ((context, index) =>
                        ProductItem(products[index])))),
          ),
        ],
      ),
    );
  }
}
