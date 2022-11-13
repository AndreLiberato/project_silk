import 'package:flutter/material.dart';

import '../data/orders.dart';
import 'order_item.dart';

class FinishedOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView.builder(
            itemCount: pedidosFinalizado.length,
            itemBuilder: ((context, index) =>
                OrderItem(pedidosFinalizado[index]))));
  }
}
