import 'package:flutter/material.dart';

import '../data/products.dart';
import '../navigation/my_bottom_navbar.dart';
import '../widgets/categories_list.dart';
import '../widgets/products_list.dart';
import '/widgets/search_input.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _categoryFilter = 1;

  void _applyCategoryFilter(int id) {
    setState(() {
      _categoryFilter = id;
    });
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
          CategoriesList(_applyCategoryFilter),
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
          Expanded(child: ProductsList(_categoryFilter, products)),
        ],
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
