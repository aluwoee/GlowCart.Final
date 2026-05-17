import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/chopper_client_provider.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products.dart';

final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSource(ref.watch(chopperClientProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteDataSourceProvider));
});

final getProductsProvider = Provider<GetProducts>((ref) {
  return GetProducts(ref.watch(productRepositoryProvider));
});

final productsProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(getProductsProvider).call();
});

final productByIdProvider = Provider.family<Product?, int>((ref, id) {
  final products = ref.watch(productsProvider).valueOrNull ?? [];
  for (final product in products) {
    if (product.id == id) return product;
  }
  return null;
});
