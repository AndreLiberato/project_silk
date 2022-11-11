import 'package:flutter/material.dart';

import '../data/carts.dart';
import 'cart_item.dart';

class CartList extends StatefulWidget {
  CartListState createState() => CartListState();
}

class CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: carts.length,
            itemBuilder: ((context, index) => CartItem(carts[index], index))));
  }
}
