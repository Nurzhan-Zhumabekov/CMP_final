import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/app_database.dart';
import '../../providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoritesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_outline, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No favorites yet',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (ctx, i) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = items[index];
              final ingredients =
                  (jsonDecode(item.ingredients) as List).cast<String>();
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, st) => Container(
                        width: 56,
                        height: 56,
                        color: const Color(0xFFEFEBE9),
                        child: const Icon(Icons.coffee,
                            color: Color(0xFF6F4E37)),
                      ),
                    ),
                  ),
                  title: Text(item.title,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.primary)),
                      Text(
                        ingredients.take(3).join(', '),
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite,
                        color: Colors.redAccent),
                    onPressed: () =>
                        ref.read(appDatabaseProvider).removeFavorite(
                              item.productId,
                            ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
