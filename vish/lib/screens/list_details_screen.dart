import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vish/data/groceries_lists.dart';
import 'package:vish/models/grocery_list.dart';

import '../widgets/list_product_item.dart';

class ListDetailsScreen extends StatelessWidget {
  const ListDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myList = ModalRoute.of(context)!.settings.arguments as GroceryList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Detalhes',
            style: TextStyle(
                color: Colors.black, fontFamily: "Acme", fontSize: 24)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Hero(
            tag: "lista-item-card",
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 3,
                                    child: Text(
                                      "Nome: ${myList.name}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  const Flexible(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 10,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      "Descrição: ${myList.description}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                  const Flexible(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 25,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      "Criação:${DateFormat("dd 'de' MMM 'de' yyyy", "pt_BR").format(myList.creationDate)}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: myList.hasAutoPayment
                                        ? Text(
                                            "Renovação:${DateFormat("dd 'de' MMM 'de' yyyy", "pt_BR").format(myList.paymentDate!)}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          )
                                        : const SizedBox(
                                            height: 5,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "R\$ ${myList.totalValue.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Flexible(
                          flex: 1,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          )),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            "Produtos",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Acme"),
                          ),
                        ),
                      ),
                      const Flexible(
                          flex: 1,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          )),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 11,
                        child: ListView.builder(
                            itemCount: myList.listProducts.length,
                            itemBuilder: ((context, index) =>
                                ListProductItem(myList.listProducts[index]))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
