import '../entities/product.dart';

abstract class MenuRepository {
  Future<List<Product>> getHotCoffees();
  Future<List<Product>> getIcedCoffees();
}
