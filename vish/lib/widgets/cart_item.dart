import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vish/providers/cart_provider.dart';

import '../models/cart_product.dart';
import 'quantity_button.dart';

class CartItem extends StatefulWidget {
  CartProduct cartItem;

  CartItem(this.cartItem);

  CartState createState() => CartState();
}

class CartState extends State<CartItem> {
  late CartProvider myCart;

  @override
  void initState() {
    super.initState();
    myCart = Provider.of<CartProvider>(context, listen: false);
  }

  void _changeQuantity(int quantityChange) {
    setState(() {
      myCart.changeProductQuantity(widget.cartItem, quantityChange);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Image.network(widget.cartItem.product.imageUrl[0]),
            ),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.cartItem.product.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(widget.cartItem.product.measure,
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 10)),
                    SizedBox(
                        width: 140,
                        child: QuantityButton(
                            widget.cartItem.quantity, _changeQuantity)),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            myCart.removeProductFromCart(widget.cartItem.product);
                          });
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.grey),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "R\$ ${myCart.getProductTotalPrice(widget.cartItem.product).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
