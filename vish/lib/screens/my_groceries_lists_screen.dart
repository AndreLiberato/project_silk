import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/groceries_lists.dart';
import '../navigation/my_drawer.dart';
import '../providers/groceries_lists_provider.dart';
import '../widgets/grocery_list_item.dart';
import '../widgets/my_appbar.dart';

class MyGroceriesListsScreen extends StatelessWidget {
  void _createGroceriesList(BuildContext context) {
    Navigator.of(context).pushNamed("/lista-form");
  }

  @override
  Widget build(BuildContext context) {
    var groceriesListProvider = context.watch<GroceriesListsProvider>();
    return Scaffold(
      appBar: MyAppBar(title: "Minhas Listas", actions: [
        IconButton(
            onPressed: () => _createGroceriesList(context),
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          Expanded(
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
                          child: Text(
                            "Manuais",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Acme"),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Automáticas",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Acme"),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ListView.builder(
                                itemCount:
                                    groceriesListProvider.manualLists.length,
                                itemBuilder: ((context, index) => InkWell(
                                      onLongPress: () => Navigator.of(context)
                                          .pushNamed("/lista-form",
                                              arguments: groceriesListProvider
                                                  .manualLists[index]),
                                      child: GroceryListItem(
                                          groceriesListProvider
                                              .manualLists[index]),
                                    ))),
                            ListView.builder(
                              itemCount: groceriesListProvider.autoLists.length,
                              itemBuilder: ((context, index) => InkWell(
                                    onLongPress: () => Navigator.of(context)
                                        .pushNamed("/lista-form",
                                            arguments: groceriesListProvider
                                                .autoLists[index]),
                                    child: GroceryListItem(
                                        groceriesListProvider.autoLists[index]),
                                  )),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
