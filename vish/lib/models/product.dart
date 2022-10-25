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
}
