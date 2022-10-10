import 'package:flutter/material.dart';

import '/widgets/search_input.dart';

const products = [
  {
    "id": "1",
    "name": "Maçã Gala Nacional",
    "measure": "Kg",
    "price": 4.99,
    "description":
        "Maçã gala nacional, produzida nas terras fantásticas. Nutritiva e suculenta."
  },
  {
    "id": "2",
    "name": "Banana Prata",
    "measure": "Kg",
    "price": 3.99,
    "description":
        "Banana prata, produzida nas terras fantásticas. Nutritiva e suculenta."
  },
  {
    "id": "3",
    "name": "Uva sem semente",
    "measure": "Kg",
    "price": 7.99,
    "description":
        "Uva sem semente, produzida nas terras fantásticas. Nutritiva e suculenta."
  },
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
          const SearchInput(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text(
              "Categorias",
              style: TextStyle(
                  fontSize: 24, color: Colors.black, fontFamily: "Acme"),
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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) => Text(
                        products[index]["name"].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
