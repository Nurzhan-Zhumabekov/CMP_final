import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/menu_repository.dart';
import '../models/product_model.dart';
import '../services/chopper_client_provider.dart';
import '../services/coffee_api_service.dart';

class MenuRepositoryImpl implements MenuRepository {
  final CoffeeApiService _apiService;

  MenuRepositoryImpl(this._apiService);

  @override
  Future<List<Product>> getHotCoffees() async {
    final response = await _apiService.getHotCoffees();
    if (!response.isSuccessful || response.body == null) {
      throw Exception('Failed to fetch hot coffees: ${response.statusCode}');
    }
    final list = jsonDecode(response.body!) as List<dynamic>;
    return list
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>)
            .toEntity(category: 'hot'))
        .toList();
  }

  @override
  Future<List<Product>> getIcedCoffees() async {
    final response = await _apiService.getIcedCoffees();
    if (!response.isSuccessful || response.body == null) {
      throw Exception('Failed to fetch iced coffees: ${response.statusCode}');
    }
    final list = jsonDecode(response.body!) as List<dynamic>;
    return list
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>)
            .toEntity(category: 'iced'))
        .toList();
  }
}

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepositoryImpl(ref.watch(coffeeApiServiceProvider));
});
