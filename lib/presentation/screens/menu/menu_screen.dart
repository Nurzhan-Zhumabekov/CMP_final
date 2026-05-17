import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/product.dart';
import '../../providers/menu_provider.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final productsAsync = ref.watch(filteredProductsProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 220,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'Coffee Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800',
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, st) => Container(
                    color: const Color(0xFF6F4E37),
                    child: const Icon(
                      Icons.coffee,
                      size: 80,
                      color: Colors.white24,
                    ),
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _CategoryTabs(
            selected: selectedCategory,
            onChanged: (cat) {
              ref.read(selectedCategoryProvider.notifier).state = cat;
              ref.read(searchQueryProvider.notifier).state = '';
            },
          ),
        ),
        SliverToBoxAdapter(
          child: _SearchBar(),
        ),
        productsAsync.when(
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) => SliverFillRemaining(
            child: _ErrorView(
              message: error.toString(),
              onRetry: () {
                if (selectedCategory == 'hot') {
                  ref.invalidate(hotCoffeesProvider);
                } else {
                  ref.invalidate(icedCoffeesProvider);
                }
              },
            ),
          ),
          data: (products) => products.isEmpty
              ? const SliverFillRemaining(
                  child: Center(child: Text('No items found')),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.72,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _ProductCard(product: products[index]),
                      childCount: products.length,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: TextField(
        onChanged: (value) =>
            ref.read(searchQueryProvider.notifier).state = value,
        decoration: InputDecoration(
          hintText: 'Search coffee...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: ref.watch(searchQueryProvider).isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () =>
                      ref.read(searchQueryProvider.notifier).state = '',
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _CategoryTabs({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          _TabChip(
            label: 'Hot ☕',
            value: 'hot',
            selected: selected,
            color: color,
            onTap: onChanged,
          ),
          const SizedBox(width: 12),
          _TabChip(
            label: 'Iced 🧊',
            value: 'iced',
            selected: selected,
            color: color,
            onTap: onChanged,
          ),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final String value;
  final String selected;
  final Color color;
  final ValueChanged<String> onTap;

  const _TabChip({
    required this.label,
    required this.value,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selected;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(value),
      selectedColor: color.withValues(alpha: 0.2),
      checkmarkColor: color,
      labelStyle: TextStyle(
        color: isSelected ? color : null,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/menu/${product.id}', extra: product),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, progress) => progress == null
                      ? child
                      : const Center(child: CircularProgressIndicator()),
                  errorBuilder: (ctx, err, st) => Container(
                    color: const Color(0xFFEFEBE9),
                    child: const Icon(
                      Icons.coffee,
                      size: 48,
                      color: Color(0xFF6F4E37),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
