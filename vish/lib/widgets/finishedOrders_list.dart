import 'package:flutter/material.dart';

import '../data/orders.dart';
import 'finished_order_item.dart';

class FinishedOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView.builder(
            itemCount: pedidosFinalizado.length,
            itemBuilder: ((context, index) =>
                FinishedOrderItem(pedidosFinalizado[index]))));
  }
}
