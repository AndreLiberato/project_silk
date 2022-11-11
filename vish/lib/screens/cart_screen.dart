import 'package:flutter/material.dart';

import '../data/carts.dart';
import '../widgets/cart_list.dart';
import '../navigation/my_bottom_navbar.dart';

double soma = 0;



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void somar(){
    for(var i = 0 ; i < carts.length; i++){
      soma = soma + carts[i].price;
    }
  }

  @override
  Widget build(BuildContext context) {
    somar();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text('Carrinho', style: TextStyle(color: Colors.black, fontFamily: "Acme", fontSize: 30)),
      ),
      body: Column(
        children:  [
          Expanded(
            child: CartList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: 
              TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFf65c05))),
                onPressed: (){},
                child: ListTile(
                title: const Text("Finalizar Pedido", style: TextStyle(color: Colors.black, fontFamily: "Acme", fontSize: 24),textAlign: TextAlign.center),
                trailing: Text("R\$ ${soma.toStringAsFixed(2)}", style: const TextStyle(color: Colors.black, fontFamily: "Acme", fontSize: 24),textAlign: TextAlign.center,),
                ) 
              )
          ),
        ]
        ,),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

}