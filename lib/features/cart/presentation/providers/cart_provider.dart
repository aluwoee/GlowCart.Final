import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../products/domain/entities/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void add(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) state[i].copyWith(quantity: state[i].quantity + 1) else state[i]
      ];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void remove(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index == -1) return;

    if (state[index].quantity > 1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) state[i].copyWith(quantity: state[i].quantity - 1) else state[i]
      ];
    } else {
      state = state.where((item) => item.product.id != product.id).toList();
    }
  }

  void clear() => state = [];
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
});