import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black87,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 2,
        selectedItemColor: Theme.of(context).primaryColor,
        iconSize: 24,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            label: "Loja",
            icon: Icon(
              Icons.store_mall_directory_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Explorar",
            icon: Icon(
              Icons.manage_search,
              color: Colors.black87,
            ),
          ),
          BottomNavigationBarItem(
            label: "Carrinho",
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black87,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favoritos",
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black87,
            ),
          ),
          BottomNavigationBarItem(
            label: "Conta",
            icon: Icon(
              Icons.manage_accounts_outlined,
              color: Colors.black87,
            ),
          ),
        ]);
  }
}
