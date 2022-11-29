import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {
  final List<OrderModel> _finishedOrders = [];
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;
  List<OrderModel> get finishedOrders => _finishedOrders;

  Future<bool> saveOrder(int index, double valorTotal) async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      if (valorTotal > 0) {
        OrderModel pedidoNew = OrderModel(
            id: index.toString(),
            number: index,
            status: 'Em Andamento',
            creatorId: user!.uid,
            valor: valorTotal);

        await FirebaseFirestore.instance
            .collection("/orders")
            .add(pedidoNew.toJson())
            .then((document) => pedidoNew.id = document.id);
        _orders.add(pedidoNew);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> changeOrderStatus(OrderModel pedido, String newStatus) async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      var newOrder = OrderModel(
          creatorId: pedido.creatorId,
          id: pedido.id,
          number: pedido.number,
          valor: pedido.valor,
          status: newStatus);
      await FirebaseFirestore.instance
          .collection("/orders")
          .doc(pedido.id)
          .update(newOrder.toJson());
      OrderModel pedidoAntigo =
          _orders.firstWhere(((elemento) => elemento.id == pedido.id));
      _orders.remove(pedidoAntigo);
      _finishedOrders.add(pedido);
      pedido.status = newStatus;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // Future<void> cancelOrder(OrderModel pedido) async{
  //   var auth = FirebaseAuth.instance;
  //   var user = auth.currentUser;

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("/orders")
  //         .doc(pedido.id)
  //         .update(pedido.toJson());
  //     OrderModel pedidoAntigo =
  //         _orders.firstWhere(((elemento) => elemento.id == pedido.id));
  //     _orders.remove(pedidoAntigo);
  //     _finishedOrders.add(pedido);
  //     notifyListeners();
  //   } catch (error) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }

  Future<void> removeOrder(OrderModel pedido) async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      await FirebaseFirestore.instance
          .collection("/orders")
          .doc(pedido.id)
          .delete();
      OrderModel pedidoRemove =
          _finishedOrders.firstWhere((elemento) => elemento.id == pedido.id);
      _finishedOrders.remove(pedidoRemove);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchOrders() async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    try {
      _finishedOrders.clear();
      _orders.clear();
      await FirebaseFirestore.instance.collection("/orders").get().then(
            (snapshot) => snapshot.docs.forEach(
              (document) {
                if (document.data()["creatorId"] == user!.uid) {
                  if (document.data()["status"] == "Finalizado" ||
                      document.data()["status"] == "Cancelado") {
                    _finishedOrders
                        .add(OrderModel.fromJson(document.id, document.data()));
                  } else {
                    _orders.add(
                      OrderModel.fromJson(document.id, document.data()),
                    );
                  }
                }
              },
            ),
          );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
