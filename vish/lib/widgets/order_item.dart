import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vish/providers/orders_provider.dart';

import '../models/order.dart';

class OrderItem extends StatefulWidget {
  OrderModel order;

  OrderItem(this.order);

  OrderState createState() => OrderState();
}

class OrderState extends State<OrderItem> {
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
          setState(() {
            _configurandoModalBottomSheet(context);
          });
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
            style: const TextStyle(
                color: Colors.grey, fontSize: 15, fontFamily: "Acme"),
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
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext bc) {
          return SizedBox(
              height: 110,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                        leading: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        ),
                        title: const Text(
                          'Confirmar Entrega',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        onTap: () {
                          myOrder
                              .changeOrderStatus(widget.order, "Finalizado")
                              .then((_) => Navigator.of(context).pop());
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 500),
                              content: Text("Pedido concluido!"),
                            ),
                          );
                        }),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                    title: const Text('Cancelar Pedido',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    onTap: () {
                      myOrder
                          .changeOrderStatus(widget.order, "Cancelado")
                          .then((_) => Navigator.of(context).pop());

                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Pedido cancelado!"),
                        ),
                      );
                    },
                  ),
                ],
              ));
        });
  }
}
