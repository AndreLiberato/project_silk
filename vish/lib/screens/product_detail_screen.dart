import 'package:flutter/material.dart';
import 'package:vish/models/product.dart';

import '../widgets/product_detail_list.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var _selectedImage = 0;

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
                    child: Image.network(
                      product.imageUrl[_selectedImage],
                      fit: BoxFit.fitWidth,
                      height: 360,
                      width: double.infinity,
                    ),
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
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
            height: 120,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          _selectedImage = index;
                        });
                      },
                      child: Container(
                        width: 85,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black54),
                        ),
                        child: Image.network(
                          product.imageUrl[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 10,
                    )),
                itemCount: product.imageUrl.length),
          ),
          ProductDetailList(product),
        ],
      ),
    );
  }
}
