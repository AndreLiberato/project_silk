import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../data/carts.dart';

class CartItem extends StatefulWidget {

  Cart cartItem;
  int index;
  CartItem(this.cartItem,this.index);
  CartState createState() => CartState(cartItem,index);
  
}

class CartState extends State<CartItem>{
  
  Cart cartState;
  int index;
  CartState(this.cartState, this.index);

  void change(int delta){
    setState(() {
      cartState.quantity = cartState.quantity + delta;
      if(cartState.quantity==0){
        cartState.quantity = 1;
      }
      cartState.price = cartState.price * cartState.quantity;
    });
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 100,
      child: Row(
        children: [
          Image.network(cartState.imageUrl),
          SizedBox(
            width: 150,
            height: 300,
            child: Column(
              children: [
                ListTile(
                  title: Text(cartState.name, style: TextStyle(color: Colors.black, fontFamily: "Acme",fontSize: 15)),
                  subtitle: Text(cartState.measure, style: TextStyle(color: Colors.grey, fontFamily: "Acme",fontSize: 15), textAlign: TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
                  child: 
                  Row(
                  children: [
                    SizedBox(
                      width:30,
                      child:
                        TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFf65c05))),
                          onPressed: (){
                            change(-1);
                          }, 
                          child: const Text("-", style: TextStyle(color: Colors.white) )),
                    ),                    
                    SizedBox(
                      width: 30,
                      child: Text(cartState.quantity.toString(), style: const TextStyle(color: Colors.black, fontFamily: "Acme",fontSize: 15),textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      width:30,
                      child:
                        TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFf65c05))),
                          onPressed: (){
                            change(1);
                          }, 
                          child: const Text("+", style: TextStyle(color: Colors.white) )),
                    ),
                  ],
                  )   
                ),           
              ],
            ),
          ),
          const SizedBox(
            width: 130,
            height: 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             IconButton(
                onPressed: (){
                  setState(() {
                    carts.removeAt(index);
                  });
                },
                icon: const Icon(Icons.close), color: Colors.grey),              
              Row(
                children: [
                  const Text("R\$ ", style: TextStyle(color: Colors.black, fontFamily: "Acme",fontSize: 20)),
                  Text(cartState.price.toStringAsFixed(2),style: const TextStyle(color: Colors.black, fontFamily: "Acme",fontSize: 20)),
                ],
              )
          ],)
        ],
      ),
    );
  }
}