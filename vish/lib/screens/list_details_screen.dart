import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vish/models/grocery_list.dart';

class ListDetailsScreen extends StatelessWidget {
  const ListDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myList = ModalRoute.of(context)!.settings.arguments as GroceryList;
    return Hero(
      tag: "detalhe-lista",
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome: ${myList.name}",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Descrição: ${myList.description}",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Criação:${DateFormat("dd 'de' MMMM 'de' yyyy", "pt_BR").format(myList.creationDate)}",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    "R\$ ${myList.totalValue}",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
