import 'package:chopper/chopper.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  ProductRemoteDataSource(this._client);

  final ChopperClient _client;

  Future<List<ProductModel>> getProducts() async {
    final response = await _client.send<dynamic, dynamic>(
      Request(
        'GET', 
        Uri.parse('/products/category/beauty'), 
        Uri.parse('https://dummyjson.com'),
      ),
    );

    if (!response.isSuccessful) {
      throw Exception('Failed to load products: ${response.statusCode}');
    }

    final body = response.body;
    if (body is! Map<String, dynamic>) {
      throw Exception('Invalid API response');
    }

    final products = body['products'];
    if (products is! List) {
      throw Exception('Products list not found');
    }

    return products
        .whereType<Map<String, dynamic>>()
        .map(ProductModel.fromJson)
        .toList();
  }
}