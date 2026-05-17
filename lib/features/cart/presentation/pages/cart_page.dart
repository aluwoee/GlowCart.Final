import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glowcart_final/features/products/domain/entities/product.dart';

import '../../../orders/presentation/providers/orders_provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  static const routeName = 'cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cart.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                final product = cartItem.product;

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: product.thumbnail.isEmpty 
                        ? null 
                        : NetworkImage(product.thumbnail),
                    child: product.thumbnail.isEmpty ? const Icon(Icons.spa) : null,
                  ),
                  title: Text(product.title),
                  subtitle: Text('${product.brand} • Qty: ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${(product.price * cartItem.quantity).toStringAsFixed(2)}'),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => ref.read(cartProvider.notifier).remove(product),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: cart.isEmpty
                ? null
                : () async {
                    // 6. Если твой ordersControllerProvider всё еще требует List<Product>, 
                    // мы «разворачиваем» CartItem обратно в плоский список продуктов:
                    final productsList = cart
                        .expand((item) => List<Product>.filled(item.quantity, item.product))
                        .toList();

                    await ref.read(ordersControllerProvider).createOrder(productsList);
                    ref.read(cartProvider.notifier).clear();
                    
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order saved locally')),
                      );
                    }
                  },
            child: Text('Checkout • \$${total.toStringAsFixed(2)}'),
          ),
        ),
      ),
    );
  }
}