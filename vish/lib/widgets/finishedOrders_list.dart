import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart';
import 'finished_order_item.dart';

class FinishedOrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderProvider = context.watch<OrdersProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: ListView.builder(
        itemCount: orderProvider.finishedOrders.length,
        itemBuilder: ((context, index) =>
            FinishedOrderItem(orderProvider.finishedOrders[index])),
      ),
    );
  }
}
