import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/orders_repository.dart';
import '../../presentation/providers/cart_provider.dart';
import '../models/order_model.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final FirebaseFirestore _firestore;

  OrdersRepositoryImpl(this._firestore);

  @override
  Stream<List<AppOrder>> watchOrders() {
    return _firestore
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map(OrderModel.fromFirestore).toList());
  }

  @override
  Future<void> placeOrder(List<CartItem> items, double total) {
    return _firestore
        .collection('orders')
        .add(OrderModel.toFirestore(items, total));
  }
}

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  return OrdersRepositoryImpl(FirebaseFirestore.instance);
});
