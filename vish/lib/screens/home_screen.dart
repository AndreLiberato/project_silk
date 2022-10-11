import 'package:flutter/material.dart';
import 'package:vish/widgets/product_item.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../widgets/category_item.dart';
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

final List<Category> categories = [
  Category(id: 1, name: "Bebidas", image: "assets/images/bebidas.png"),
  Category(id: 2, name: "Frutas", image: "assets/images/frutas.png"),
  Category(id: 3, name: "Grãos", image: "assets/images/graos.png")
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
        title: const Text(
          "VISH",
          style: TextStyle(
              shadows: [Shadow(color: Colors.black26, offset: Offset(1, 3))],
              color: Color(0xFFf65c05),
              fontFamily: "Cherry Bomb",
              fontSize: 24),
        ),
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
          const SizedBox(
            height: 10,
          ),
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: SizedBox(
              width: 400,
              height: 100,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 15,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: ((context, index) =>
                      CategoryItem(categories[index]))),
            ),
          ),
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
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 150 / 171,
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
