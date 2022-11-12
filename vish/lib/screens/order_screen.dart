import 'package:flutter/material.dart';

import '../data/orders.dart';
import '../widgets/orders_list.dart';
import '../widgets/finishedOrders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed:(){},color: Colors.black),
          backgroundColor:Colors.transparent,
          elevation: 0,
          title: const Text('Pedidos', style: TextStyle(color: Colors.black, fontFamily: "Acme")),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: TabBar(
              labelColor: Color(0xFFf65c05),
              indicatorColor: Color(0xFFf65c05),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  child: Text('Em andamento', style: TextStyle(color: Colors.black, fontFamily: "Acme")),
                ),
                Tab(
                  child: Text('Histórico', style: TextStyle(color: Colors.black, fontFamily: "Acme")),
                ),
              ],
            ),
          ), 
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: OrderList(),
            ),
            Center(
              child: FinishedOrderList(),
            ),
          ],
        ),
      ),
    );
  }
}
