import 'package:flutter/material.dart';

class Order {
  int id;
  String number;
  String status;
  String valor;
  Color color;

  Order(
    {required this.id,
     required this.number,
     required this.status,
     required this.color,
     required this.valor});
}