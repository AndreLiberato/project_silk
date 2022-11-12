import 'package:flutter/material.dart';

import '../models/product.dart';
import 'quantity_button.dart';

class ProductDetailList extends StatefulWidget {
  Product product;

  ProductDetailList(this.product);

  @override
  State<ProductDetailList> createState() => _ProductDetailListState();
}

class _ProductDetailListState extends State<ProductDetailList> {
  late final rating;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    rating = widget.product.rating;
  }

  void _changeQuantity(int quantityChange) {
    setState(() {
      _quantity += quantityChange;
    });
  }

  List<Icon> _rateBuilder() {
    switch (rating) {
      case 0:
        return const [
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        ];
      case 1:
        return const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        ];
      case 2:
        return const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        ];
      case 3:
        return const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        ];
      case 4:
        return const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
        ];
      default:
        return const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name,
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.product.measure,
                            style: const TextStyle(
                                fontFamily: "Acme",
                                fontSize: 14,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 46,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: QuantityButton(_quantity, _changeQuantity)),
                  Flexible(
                    flex: 3,
                    child: Text(
                      "R\$ ${widget.product.price}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Detalhe do produto",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Acme",
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.description,
                style: const TextStyle(
                    fontFamily: "Acme", fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Avaliações",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Acme",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ..._rateBuilder(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Comentários",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Acme",
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
