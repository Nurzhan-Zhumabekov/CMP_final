import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/order.dart';
import '../../presentation/providers/cart_provider.dart';

class OrderModel {
  static AppOrder fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final rawItems = data['items'] as List<dynamic>? ?? [];

    final items = rawItems.map((e) {
      final map = e as Map<String, dynamic>;
      return OrderItem(
        productId: (map['productId'] as num).toInt(),
        title: map['title'] as String,
        quantity: (map['quantity'] as num).toInt(),
        price: (map['price'] as num).toDouble(),
      );
    }).toList();

    return AppOrder(
      id: doc.id,
      items: items,
      total: (data['total'] as num).toDouble(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      status: data['status'] as String? ?? 'pending',
    );
  }

  static Map<String, dynamic> toFirestore(List<CartItem> items, double total) {
    return {
      'items': items
          .map((i) => {
                'productId': i.product.id,
                'title': i.product.title,
                'quantity': i.quantity,
                'price': i.product.price,
              })
          .toList(),
      'total': total,
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'pending',
    };
  }
}
