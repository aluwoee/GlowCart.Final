import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/orders_provider.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Order History')),
      body: ordersState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('No orders yet'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                leading: const Icon(Icons.receipt_long_outlined),
                title: Text(order.productTitles),
                subtitle: Text(order.createdAt.toString()),
                trailing: Text('\$${order.totalPrice.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
