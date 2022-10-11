import 'package:flutter/material.dart';

import '../navigation/my_bottom_navbar.dart';
import '../widgets/categories_list.dart';
import '../widgets/products_list.dart';
import '/widgets/search_input.dart';

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
        children: const [
          Center(child: SearchInput()),
          SizedBox(
            height: 10,
          ),
          CategoriesList(),
          SizedBox(
            height: 25,
          ),
          Expanded(child: ProductsList()),
        ],
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
