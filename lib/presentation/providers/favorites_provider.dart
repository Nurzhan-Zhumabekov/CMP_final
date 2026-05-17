import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../domain/entities/product.dart';

final favoritesStreamProvider = StreamProvider<List<FavoriteItem>>((ref) {
  return ref.watch(appDatabaseProvider).watchFavorites();
});

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<int>>(FavoritesNotifier.new);

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier(this._ref) : super({}) {
    _ref.listen(favoritesStreamProvider, (_, next) {
      next.whenData((items) {
        state = items.map((e) => e.productId).toSet();
      });
    });
  }

  final Ref _ref;

  AppDatabase get _db => _ref.read(appDatabaseProvider);

  Future<void> toggle(Product product) async {
    if (state.contains(product.id)) {
      await _db.removeFavorite(product.id);
    } else {
      await _db.addFavorite(
        FavoriteItemsCompanion(
          productId: Value(product.id),
          title: Value(product.title),
          description: Value(product.description),
          imageUrl: Value(product.imageUrl),
          category: Value(product.category),
          price: Value(product.price),
          ingredients: Value(jsonEncode(product.ingredients)),
        ),
      );
    }
  }

  bool isFavorite(int productId) => state.contains(productId);
}
