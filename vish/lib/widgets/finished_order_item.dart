import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vish/providers/orders_provider.dart';

import '../models/order.dart';

class FinishedOrderItem extends StatefulWidget {
  OrderModel order;

  FinishedOrderItem(this.order);

  FinishedOrderState createState() => FinishedOrderState();
}

class FinishedOrderState extends State<FinishedOrderItem> {
  late OrdersProvider myOrder =
      Provider.of<OrdersProvider>(context, listen: false);
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 100,
      child: ListTile(
        onTap: () {
          _configurandoModalBottomSheet(context);
        },
        leading: const Icon(
          Icons.shopping_bag,
          color: Color(0xFFf65c05),
          size: 35,
        ),
        title: Text("#${widget.order.number.toString()}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: "Acme")),
        subtitle: Column(children: [
          Text(
            widget.order.status,
            style: TextStyle(
                color: widget.order.status == "Cancelado"
                    ? Colors.red
                    : Colors.green,
                fontSize: 15,
                fontFamily: "Acme"),
            textAlign: TextAlign.start,
          ),
          Text(DateFormat("d 'de' MMMM 'de' y", "pt_BR").format(data),
              style: const TextStyle(
                  color: Colors.grey, fontSize: 15, fontFamily: "Acme"),
              textAlign: TextAlign.start)
        ]),
        trailing: Text(
          "R\$ ${widget.order.valor.toStringAsFixed(2)}",
          style: const TextStyle(
              color: Color(0xFFf65c05), fontSize: 20, fontFamily: "Acme"),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _configurandoModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext bc) {
          return SizedBox(
              height: 80,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                    title: const Text('Remover Pedido',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    onTap: () {
                      setState(() {
                        myOrder
                            .removeOrder(widget.order)
                            .then((_) => Navigator.of(context).pop());
                      });
                    },
                  ),
                ],
              ));
        });
  }
}
