import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.brand,
    required super.category,
    required super.thumbnail,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? 'Unknown product',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      brand: json['brand'] as String? ?? 'No brand',
      category: json['category'] as String? ?? 'General',
      thumbnail: json['thumbnail'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'rating': rating,
      };
}
