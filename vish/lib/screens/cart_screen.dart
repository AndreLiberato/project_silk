import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/my_drawer.dart';
import '../providers/orders_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/my_appbar.dart';
import '../widgets/cart_list.dart';

int index = 1;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myCart = Provider.of<CartProvider>(context);
    var myOrder = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: MyAppBar(title: "Meu carrinho"),
      body: Column(
        children: [
          Expanded(
            child: CartList(),
          ),
          Container(
              width: 500,
              height: 60,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (await myOrder
                        .saveOrder(index, myCart.getTotalValueOfCartItems())
                        .then((operationResult) {
                      return operationResult;
                    })) {
                      index++;
                      myCart.clear();
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Seu pedido foi computado."),
                        ),
                      );
                    }
                  },
                  child: ListTile(
                    dense: true,
                    title: const Text("Finalizar Pedido",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Acme",
                            fontSize: 22),
                        textAlign: TextAlign.center),
                    trailing: Text(
                      "R\$ ${myCart.getTotalValueOfCartItems().toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Acme",
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
