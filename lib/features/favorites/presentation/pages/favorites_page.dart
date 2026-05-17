import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favorites_provider.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  static const routeName = 'favorites';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoritesState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (favorites) {
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorite products yet'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final product = favorites[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: product.thumbnail.isEmpty ? null : NetworkImage(product.thumbnail),
                  child: product.thumbnail.isEmpty ? const Icon(Icons.spa) : null,
                ),
                title: Text(product.title),
                subtitle: Text(product.brand),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
