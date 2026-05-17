import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/menu_repository_impl.dart';
import '../../domain/entities/product.dart';

final selectedCategoryProvider = StateProvider<String>((ref) => 'hot');

final hotCoffeesProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(menuRepositoryProvider).getHotCoffees();
});

final icedCoffeesProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(menuRepositoryProvider).getIcedCoffees();
});

final currentProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final category = ref.watch(selectedCategoryProvider);
  return category == 'hot'
      ? ref.watch(hotCoffeesProvider)
      : ref.watch(icedCoffeesProvider);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();
  final productsAsync = ref.watch(currentProductsProvider);

  if (query.isEmpty) return productsAsync;

  return productsAsync.whenData(
    (products) => products
        .where((p) =>
            p.title.toLowerCase().contains(query) ||
            p.description.toLowerCase().contains(query))
        .toList(),
  );
});
