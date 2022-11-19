import 'package:flutter/material.dart';

import '../data/orders.dart';
import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {

  final List<Order> _finishedOrders = pedidosFinalizado;
  final List<Order> _orders = pedidos;

  List<Order> get orders => _orders;
  List<Order> get finishedOrders => _finishedOrders;

  void add(Order pedido){
    Order pedidoFinal = Order(id: pedido.id, number: pedido.number, status: 'Entregue', color: Colors.green, valor: pedido.valor);
    Order pedidoAntigo = _orders.firstWhere(((elemento) => elemento.id == pedido.id));
    _orders.remove(pedidoAntigo);
    _finishedOrders.add(pedidoFinal);
    notifyListeners();
  }

  void cancel(Order pedido){
    Order pedidoFinal = Order(id: pedido.id, number: pedido.number, status: 'Cancelado', color: Colors.red, valor: pedido.valor);
    Order pedidoAntigo = _orders.firstWhere(((elemento) => elemento.id == pedido.id));
    _orders.remove(pedidoAntigo);
    _finishedOrders.add(pedidoFinal);
    notifyListeners();
  }

  void remove(Order pedido){
    
  }

}