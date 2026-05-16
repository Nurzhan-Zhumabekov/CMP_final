class Product {
  final int id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String imageUrl;
  final String category;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.imageUrl,
    required this.category,
    required this.price,
  });
}
