import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/orders_repository_impl.dart';
import '../../domain/entities/order.dart';

export '../../data/repositories/orders_repository_impl.dart'
    show ordersRepositoryProvider;

final ordersProvider = StreamProvider<List<AppOrder>>((ref) {
  return ref.watch(ordersRepositoryProvider).watchOrders();
});
