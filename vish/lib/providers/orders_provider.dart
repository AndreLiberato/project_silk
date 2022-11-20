import 'package:flutter/material.dart';

import '../data/orders.dart';
import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {

  final List<Order> _finishedOrders = pedidosFinalizado;
  final List<Order> _orders = pedidos;

  List<Order> get orders => _orders;
  List<Order> get finishedOrders => _finishedOrders;

  int add(int index, double valorTotal){
    if(valorTotal>0){
      Order pedidoNew = Order(id: index, number: index, status: 'Em Andamento', color: Colors.grey, valor: valorTotal);
      _orders.add(pedidoNew);
      notifyListeners();
      return 1;
    }    
    return 0;
  }

  void confirm(Order pedido){
    Order pedidoFinal = Order(id: pedido.id, number: pedido.number, status: 'Entregue', color: Colors.lightGreen, valor: pedido.valor);
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
    Order pedidoRemove = _finishedOrders.firstWhere((elemento) => elemento.id == pedido.id);
    _finishedOrders.remove(pedidoRemove);
    notifyListeners();
  }

}