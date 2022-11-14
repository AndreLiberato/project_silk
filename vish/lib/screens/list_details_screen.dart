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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Hero(
            tag: "lista-item-card",
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
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
                                    flex: 1,
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
                                    flex: 1,
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
                                    flex: 2,
                                    child: Text(
                                      "Criação:${DateFormat("dd 'de' MMMM 'de' yyyy", "pt_BR").format(myList.creationDate)}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                  myList.hasAutoPayment
                                      ? Text(
                                          "Renovação de pagamento:${DateFormat("dd 'de' MMMM 'de' yyyy", "pt_BR").format(myList.paymentDate!)}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        )
                                      : const SizedBox(
                                          height: 10,
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
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 6,
                        child: ListView.builder(
                            itemCount: myList.listProducts.length,
                            itemBuilder: ((context, index) =>
                                ListProductItem(myList.listProducts[index]))),
                      )
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
