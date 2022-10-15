class Product {
  String id;
  String name;
  String imageUrl;
  String measure;
  double price;
  String description;
  List<int> categories;

  Product(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.measure,
      required this.price,
      required this.description,
      required this.categories});
}
