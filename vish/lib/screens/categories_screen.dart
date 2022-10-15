import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Categorias",
          style:
              TextStyle(fontSize: 24, fontFamily: "Acme", color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text("Categorias"),
      ),
    );
  }
}
