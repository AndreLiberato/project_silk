import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';

class MyGroceriesListsScreen extends StatelessWidget {
  const MyGroceriesListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Minhas Listas",
      ),
      body: Column(
        children: [
          Expanded(
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
                    child: TabBarView(children: [
                      ListView.builder(
                          itemCount: 15,
                          itemBuilder: ((context, index) => ListTile(
                              leading:
                                  CircleAvatar(backgroundColor: Colors.green),
                              title: Text(
                                "Listas manual $index",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )))),
                      ListView.builder(
                          itemCount: 20,
                          itemBuilder: ((context, index) => ListTile(
                              leading:
                                  CircleAvatar(backgroundColor: Colors.green),
                              title: Text(
                                "Lista automatizada $index",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )))),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
