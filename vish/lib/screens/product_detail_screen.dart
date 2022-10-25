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
        children: [
          Hero(
            tag: product.id,
            child: Material(
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      product.imageUrl[_selectedImage],
                      fit: BoxFit.contain,
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
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 12),
            height: 95,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          _selectedImage = index;
                        });
                      },
                      child: Align(
                        child: Container(
                          width: _selectedImage == index ? 90 : 82,
                          height: _selectedImage == index ? 90 : 82,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 0),
                                  color: Colors.black87),
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  color: Colors.white),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black54),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.imageUrl[index],
                              fit: BoxFit.contain,
                            ),
                          ),
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
