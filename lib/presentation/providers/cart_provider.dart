import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  CartItem copyWith({int? quantity}) =>
      CartItem(product: product, quantity: quantity ?? this.quantity);

  double get subtotal => product.price * quantity;
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void add(Product product) {
    final idx = state.indexWhere((i) => i.product.id == product.id);
    if (idx >= 0) {
      final updated = [...state];
      updated[idx] = updated[idx].copyWith(quantity: updated[idx].quantity + 1);
      state = updated;
    } else {
      state = [...state, CartItem(product: product, quantity: 1)];
    }
  }

  void increment(int productId) {
    state = state
        .map((i) => i.product.id == productId
            ? i.copyWith(quantity: i.quantity + 1)
            : i)
        .toList();
  }

  void decrement(int productId) {
    final item = state.firstWhere((i) => i.product.id == productId);
    if (item.quantity <= 1) {
      remove(productId);
    } else {
      state = state
          .map((i) => i.product.id == productId
              ? i.copyWith(quantity: i.quantity - 1)
              : i)
          .toList();
    }
  }

  void remove(int productId) =>
      state = state.where((i) => i.product.id != productId).toList();

  void clear() => state = [];

  double get total =>
      state.fold(0.0, (sum, item) => sum + item.subtotal);

  int get totalItems =>
      state.fold(0, (sum, item) => sum + item.quantity);
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItem>>((_) => CartNotifier());

final cartTotalProvider = Provider<double>((ref) {
  final notifier = ref.watch(cartProvider.notifier);
  ref.watch(cartProvider);
  return notifier.total;
});

final cartItemCountProvider = Provider<int>((ref) {
  final notifier = ref.watch(cartProvider.notifier);
  ref.watch(cartProvider);
  return notifier.totalItems;
});
