import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  var _quantity = 1;

  void _changeQuantity(int quantityChange) {
    setState(() {
      _quantity += quantityChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: _quantity > 1 ? () => _changeQuantity(-1) : null,
            icon: Icon(
              Icons.remove_rounded,
              size: 30,
              color: _quantity > 1
                  ? Theme.of(context).primaryColor
                  : Colors.black45,
            ),
          ),
          Container(
            width: 45,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              _quantity.toString(),
              style: const TextStyle(
                  color: Colors.black, fontFamily: "Acme", fontSize: 22),
            ),
          ),
          IconButton(
            onPressed: () => _changeQuantity(1),
            icon: Icon(
              Icons.add_rounded,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
