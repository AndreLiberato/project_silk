import 'package:flutter/material.dart';

import '../models/list_product.dart';

class ListProductItem extends StatelessWidget {
  ListProduct listProduct;
  bool isEditing;

  ListProductItem(this.listProduct, this.isEditing);

  final _quantityController = TextEditingController();

  void _updateQuantity(BuildContext context) {
    if (_quantityController.text.isNotEmpty) {
      var quantity = int.tryParse(_quantityController.text);
      if (quantity == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildSnackBar("Insira uma quantidade válida!"));
        _quantityController.text = listProduct.quantity.toString();
      }
      if (quantity! < 1 || quantity > 99) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildSnackBar("Insira uma quantidade entre 1 e 99!"));
        _quantityController.text = listProduct.quantity.toString();
      } else {
        listProduct.quantity = quantity;
      }
    }
  }

  SnackBar buildSnackBar(String message) {
    return SnackBar(content: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(listProduct.product.imageUrl[0])),
        title: Text(
          listProduct.product.name,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        trailing: SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 75,
                child: Text(
                  "Quantidade:",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: TextField(
                  enabled: isEditing,
                  controller: _quantityController,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5, top: 5),
                    labelText: listProduct.quantity.toString(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _updateQuantity(context),
                ),
              ),
            ],
          ),
        ));
  }
}
