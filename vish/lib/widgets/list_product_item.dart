import 'package:flutter/material.dart';

import '../models/list_product.dart';

class ListProductItem extends StatelessWidget {
  ListProduct listProduct;

  ListProductItem(this.listProduct);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(listProduct.product.imageUrl[0])),
        title: Text(
          listProduct.product.name,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        trailing: Text(
          "Quantidade: ${listProduct.quantity}x",
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ));
  }
}
