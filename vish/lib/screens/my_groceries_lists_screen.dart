import 'package:flutter/material.dart';

import '../data/groceries_lists.dart';
import '../widgets/grocery_list_item.dart';
import '../widgets/my_appbar.dart';

class MyGroceriesListsScreen extends StatelessWidget {
  var manualLists = groceriesLists
      .where(
        (groceryList) => groceryList.hasAutoPayment == false,
      )
      .toList();
  var autoLists = groceriesLists
      .where(
        (groceryList) => groceryList.hasAutoPayment == true,
      )
      .toList();
  void _createGroceriesList(BuildContext context) {
    Navigator.of(context).pushNamed("/lista-form");
  }

  void _editGroceriesList(String nome, BuildContext context) {
    Navigator.of(context).pushNamed("/lista-form", arguments: nome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Minhas Listas", actions: [
        IconButton(
            onPressed: () => _createGroceriesList(context),
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: "detalhe-lista",
              child: Material(
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: const [
                          Tab(
                            text: "Manuais",
                          ),
                          Tab(
                            text: "Automatizadas",
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListView.builder(
                                  itemCount: manualLists.length,
                                  itemBuilder: ((context, index) =>
                                      GroceryListItem(manualLists[index]))),
                              ListView.builder(
                                itemCount: autoLists.length,
                                itemBuilder: ((context, index) =>
                                    GroceryListItem(autoLists[index])),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
