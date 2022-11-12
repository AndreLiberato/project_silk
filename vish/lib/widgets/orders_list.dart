import 'package:flutter/material.dart';

import '../data/orders.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: ListView.builder(
                itemCount: pedidos.length,
                itemBuilder: ((context, index) =>
                    OrderItem(pedidos[index])))),
    );
  }

}