import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderProvider = context.watch<OrdersProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: ListView.builder(
        itemCount: orderProvider.orders.length,
        itemBuilder: ((context, index) =>
            OrderItem(orderProvider.orders[index])),
      ),
    );
  }
}
