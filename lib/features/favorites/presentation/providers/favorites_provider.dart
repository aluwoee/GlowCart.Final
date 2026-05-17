import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../products/domain/entities/product.dart';

final favoritesProvider = StreamProvider<List<Product>>((ref) {
  return ref.watch(databaseProvider).watchFavorites().map((driftItems) {
    return driftItems.map((item) {
      return Product(
        id: item.id,
        title: item.title,
        price: item.price,
        brand: item.brand,
        thumbnail: item.thumbnail,
        description: '', 
        category: '',
        rating: 0.0,
      );
    }).toList();
  });
});

final isFavoriteProvider = Provider.family<bool, int>((ref, id) {
  final favorites = ref.watch(favoritesProvider).valueOrNull ?? [];
  return favorites.any((item) => item.id == id);
});

final favoritesControllerProvider = Provider<FavoritesController>((ref) {
  return FavoritesController(ref.watch(databaseProvider));
});

class FavoritesController {
  const FavoritesController(this._database);

  final AppDatabase _database;

  Future<void> toggleFavorite(Product product, bool isFavorite) async {
    if (isFavorite) {
      await _database.removeFavorite(product.id);
      return;
    }

    await _database.addFavorite(
      FavoriteProductsCompanion.insert(
        id: Value(product.id),
        title: product.title,
        price: product.price,
        brand: product.brand,
        thumbnail: product.thumbnail,
      ),
    );
  }
}
