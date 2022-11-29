import 'dart:convert';

class Product {
  String id;
  String name;
  List<String> imageUrl;
  String measure;
  double price;
  String description;
  List<int> categories;
  int rating;

  Product(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.measure,
      required this.price,
      required this.description,
      required this.categories,
      required this.rating});

  factory Product.fromJson(String id, Map<String, dynamic> json) {
    return Product(
        id: id,
        name: json["name"],
        imageUrl: List<String>.from(json["imageUrl"]),
        measure: json["measure"],
        price: json["price"],
        description: json["description"],
        categories: List<int>.from(json["categories"]),
        rating: json["rating"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "measure": measure,
      "price": price,
      "categories": categories,
      "imageUrl": imageUrl,
      "rating": rating
    };
  }
}
