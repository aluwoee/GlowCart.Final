class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.rating,
  });

  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final String category;
  final String thumbnail;
  final double rating;
}
