class OrderItem {
  final int productId;
  final String title;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });

  double get subtotal => price * quantity;
}

class AppOrder {
  final String id;
  final List<OrderItem> items;
  final double total;
  final DateTime createdAt;
  final String status;

  const AppOrder({
    required this.id,
    required this.items,
    required this.total,
    required this.createdAt,
    required this.status,
  });
}
