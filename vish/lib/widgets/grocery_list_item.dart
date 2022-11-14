import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/grocery_list.dart';
import '../providers/groceries_lists_provider.dart';
import '../screens/list_details_screen.dart';

class GroceryListItem extends StatelessWidget {
  GroceryList groceryList;

  GroceryListItem(this.groceryList);

  @override
  Widget build(BuildContext context) {
    var listsProvider = context.read<GroceriesListsProvider>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        height: 90,
        alignment: Alignment.center,
        child: Dismissible(
          key: Key(groceryList.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => listsProvider.removeList(groceryList),
          confirmDismiss: (_) async {
            return await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text(
                  "Tem certeza que deseja excluir a lista?",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Sim',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        'Não',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
            );
          },
          background: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: const Icon(Icons.delete),
            ),
          ),
          child: Hero(
            tag: "lista-item-card-${groceryList.id}",
            child: Card(
              elevation: 3,
              child: ListTile(
                onTap: () => Navigator.of(context)
                    .pushNamed("/lista-detalhes", arguments: groceryList),
                leading: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Criação",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(DateFormat('dd MMM', "pt_BR")
                            .format(groceryList.creationDate)),
                        Text(DateFormat('yyyy')
                            .format(groceryList.creationDate)),
                      ],
                    ),
                  ),
                ),
                title: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: groceryList.name,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      WidgetSpan(
                        child: groceryList.hasAutoPayment
                            ? Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                showDuration: const Duration(seconds: 1),
                                message: DateFormat(
                                        "'renovação em: ' dd/MM/yyyy", "pt_BR")
                                    .format(groceryList.paymentDate!)
                                    .toString(),
                                child: const Icon(
                                  Icons.timer,
                                  color: Colors.green,
                                ),
                              )
                            : const Icon(
                                Icons.timer,
                                color: Colors.grey,
                              ),
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  groceryList.description,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                trailing: Text(
                    "R\$ ${groceryList.getTotalValue().toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ),
            ),
          ),
        ));
  }
}
