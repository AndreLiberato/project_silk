import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';

class ListFormScreen extends StatefulWidget {
  const ListFormScreen({super.key});

  @override
  State<ListFormScreen> createState() => _ListFormScreenState();
}

class _ListFormScreenState extends State<ListFormScreen> {
  @override
  Widget build(BuildContext context) {
    var groceryList = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: MyAppBar(
          title: groceryList == null ? "Crie sua lista" : "Editando lista"),
      body: Center(
          child: Text(
        groceryList != null ? "Editando $groceryList" : "Criar Form de lista",
        style: TextStyle(fontSize: 30, color: Colors.black),
      )),
    );
  }
}
