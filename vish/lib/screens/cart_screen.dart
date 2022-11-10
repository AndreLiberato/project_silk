import 'package:flutter/material.dart';

import '../navigation/my_bottom_navbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 2,
        title: const Text('Carrinho', style: TextStyle(color: Colors.black, fontFamily: "Acme")),
      ),
      body: Column(
        children: const [
          Expanded(
          child: Text("Teste"),
          ),
          Icon(Icons.shop),
        ]
        ,),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

}