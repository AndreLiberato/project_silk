import 'package:flutter/material.dart';
import 'package:vish/navigation/my_drawer.dart';
import 'package:vish/screens/cart_screen.dart';

import '../navigation/my_bottom_navbar.dart';
import 'my_groceries_lists_screen.dart';
import 'products_overview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  void _changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const ProductsOverviewScreen(),
    MyGroceriesListsScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: MyBottomNavBar(_selectedIndex, _changeScreen),
    );
  }
}
