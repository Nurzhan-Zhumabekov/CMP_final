import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'native_connection.dart' if (dart.library.html) 'web_connection.dart';

part 'app_database.g.dart';

class FavoriteItems extends Table {
  IntColumn get productId => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get imageUrl => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  TextColumn get ingredients => text()();

  @override
  Set<Column> get primaryKey => {productId};
}

@DriftDatabase(tables: [FavoriteItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<FavoriteItem>> watchFavorites() =>
      select(favoriteItems).watch();

  Future<void> addFavorite(FavoriteItemsCompanion entry) =>
      into(favoriteItems).insertOnConflictUpdate(entry);

  Future<void> removeFavorite(int productId) =>
      (delete(favoriteItems)..where((t) => t.productId.equals(productId)))
          .go();
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
