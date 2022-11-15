import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int _selectedIndex;
  final Function _changeScreen;

  MyBottomNavBar(this._selectedIndex, this._changeScreen);

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
        currentIndex: _selectedIndex,
        onTap: (index) => _changeScreen(index),
        items: const [
          BottomNavigationBarItem(
            label: "Loja",
            icon: Icon(
              Icons.store_mall_directory_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Listas",
            icon: Icon(
              Icons.list,
            ),
          ),
          BottomNavigationBarItem(
            label: "Carrinho",
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            label: "Pedidos",
            icon: Icon(
              Icons.list_alt,
            ),
          ),
          BottomNavigationBarItem(
            label: "Conta",
            icon: Icon(
              Icons.manage_accounts_outlined,
            ),
          ),
        ]);
  }
}
