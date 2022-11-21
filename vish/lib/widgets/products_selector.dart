import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsSelector extends StatefulWidget {
  List<Product> _products;
  List<Product> _selectedProducts;
  Function _addSelectedProductsToList;

  ProductsSelector(
      this._products, this._selectedProducts, this._addSelectedProductsToList);

  @override
  State<ProductsSelector> createState() => _ProductsSelectorState();
}

class _ProductsSelectorState extends State<ProductsSelector> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget._products.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget._selectedProducts
                    .contains(widget._products[index])) {
                  widget._selectedProducts.remove(widget._products[index]);
                } else {
                  widget._selectedProducts.add(widget._products[index]);
                }
                widget._addSelectedProductsToList(widget._selectedProducts);
              });
            },
            child: ListTile(
              key: UniqueKey(),
              selected:
                  widget._selectedProducts.contains(widget._products[index]),
              selectedTileColor: Theme.of(context).primaryColor,
              leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    widget._products[index].imageUrl[0],
                  )),
              title: Text(
                widget._products[index].name,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              trailing: Text(
                "R\$ ${widget._products[index].price}",
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          );
        }));
  }
}
