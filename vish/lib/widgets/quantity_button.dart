import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  Function _changeQuantity;
  int _quantity;

  QuantityButton(this._quantity, this._changeQuantity);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  void initState() {
    super.initState();
  }

  void changeQuantity(int quantityChange) {
    setState(() {
      widget._quantity += quantityChange;
      widget._changeQuantity(quantityChange);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: widget._quantity > 1 ? () => changeQuantity(-1) : null,
            icon: Icon(
              Icons.remove_rounded,
              size: 15,
              color: widget._quantity > 1
                  ? Theme.of(context).primaryColor
                  : Colors.black45,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              widget._quantity.toString(),
              style: const TextStyle(
                  color: Colors.black, fontFamily: "Acme", fontSize: 22),
            ),
          ),
          IconButton(
            onPressed: () => widget._quantity < 99 ? changeQuantity(1) : null,
            icon: Icon(
              Icons.add_rounded,
              size: 15,
              color: widget._quantity < 99
                  ? Theme.of(context).primaryColor
                  : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
