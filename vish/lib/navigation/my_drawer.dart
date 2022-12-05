import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vish/providers/auth_provider.dart';
import 'package:vish/providers/cart_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                context.read<CartProvider>().clear();
                context.read<AuthProvider>().logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login-screen", (route) => false);
              }),
        ],
      ),
    );
  }
}
