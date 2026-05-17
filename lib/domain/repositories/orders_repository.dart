import '../entities/order.dart';
import '../../presentation/providers/cart_provider.dart';

abstract class OrdersRepository {
  Stream<List<AppOrder>> watchOrders();
  Future<void> placeOrder(List<CartItem> items, double total);
}
