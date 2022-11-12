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
      //drawer de perfil
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFf65c05),
              ),
              child: Text('Perfil de Usuário',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Acme", fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.edit,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text('Editar Perfil',
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.store,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text('Minha Loja',
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_checkout,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text("Minhas Vendas",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text("Minhas Compras",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text("Compras em Andamento",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card,
                  size: 16, color: Color.fromRGBO(23, 23, 37, 1)),
              title: const Text("Cartões Salvos",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 37, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout,
                  size: 16, color: Color.fromRGBO(217, 36, 36, 1)),
              title: const Text("Sair do Aplicativo",
                  style: TextStyle(
                      color: Color.fromRGBO(217, 36, 36, 1),
                      fontFamily: "Acme",
                      fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //fim do drawer de perfil
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
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
