import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      semanticContainer: true,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: 149,
        height: 171,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
                height: 90,
              ),
            ),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              product.measure,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "R\$ ${product.price}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Ink(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(40, 80)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
