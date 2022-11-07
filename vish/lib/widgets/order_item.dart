import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderItem extends StatelessWidget {

  Order order;

  OrderItem(this.order);
  
  DateTime data = DateTime.now();

  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 100,
      child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Color(0xFFf65c05),size: 35,),
              title:  Text(order.number, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Acme")),
              subtitle: Column(children: [Text(order.status, style: TextStyle(color: order.color, fontSize: 15, fontFamily: "Acme"), textAlign: TextAlign.start,),Text(DateFormat("d 'de' MMMM 'de' y","pt_BR").format(data), style: const TextStyle(color: Colors.grey, fontSize: 15, fontFamily: "Acme"), textAlign: TextAlign.start)]),
              trailing: Text(order.valor, style: const TextStyle(color: Color(0xFFf65c05), fontSize: 20, fontFamily: "Acme"), textAlign: TextAlign.center,),
            ),
      );
  }

}