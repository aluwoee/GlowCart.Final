import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../providers/product_providers.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({super.key, required this.productId});

  static const routeName = 'productDetails';
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: productsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (_) {
          final product = ref.watch(productByIdProvider(productId));
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          final isFavorite = ref.watch(isFavoriteProvider(product.id));

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.spa, size: 80),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('${product.brand} • ${product.category}'),
              const SizedBox(height: 8),
              Text('Rating: ${product.rating}'),
              const SizedBox(height: 8),
              Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Text(product.description),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        ref.read(cartProvider.notifier).add(product);
                        context.go('/cart');
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text('Add to cart'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton.filledTonal(
                    onPressed: () => ref
                        .read(favoritesControllerProvider)
                        .toggleFavorite(product, isFavorite),
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
