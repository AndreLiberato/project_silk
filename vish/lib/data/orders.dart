import 'package:flutter/material.dart';
import '../models/order.dart';

final List<Order> pedidos = [
  Order(id: 1, number: "#1", status: "Em andamento", valor: "R\$ 7,99",color: Colors.grey),
  Order(id: 2, number: "#2", status: "Em andamento", valor: "R\$ 7,99",color: Colors.grey),
  Order(id: 3, number: "#3", status: "Em andamento", valor: "R\$ 7,99",color: Colors.grey),
];

final List<Order> pedidosFinalizado = [
  Order(id: 1, number: "#4", status: "Entregue", valor: "R\$ 7,99",color: Colors.lightGreen),
  Order(id: 2, number: "#5", status: "Cancelado", valor: "R\$ 7,99",color: Colors.red),
  Order(id: 3, number: "#6", status: "Entregue", valor: "R\$ 7,99",color: Colors.lightGreen),
];
