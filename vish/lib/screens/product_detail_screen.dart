import 'package:flutter/material.dart';
import 'package:vish/models/product.dart';

import '../widgets/product_detail_list.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: product.id,
            child: Material(
              child: Stack(
                children: [
                  Center(
                    child: Image.network(product.imageUrl,
                        fit: BoxFit.contain, height: 360),
                  ),
                  Positioned(
                    top: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 40,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 8,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Adicionar ao carrinho",
                        style: TextStyle(fontFamily: "Acme", fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ProductDetailList(product),
        ],
      ),
    );
  }
}
