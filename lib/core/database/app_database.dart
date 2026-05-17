import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_database.g.dart';

class FavoriteProducts extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  TextColumn get brand => text()();
  TextColumn get thumbnail => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productTitles => text()();
  RealColumn get totalPrice => real()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [FavoriteProducts, Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteProduct>> getFavorites() => select(favoriteProducts).get();

  Stream<List<FavoriteProduct>> watchFavorites() => select(favoriteProducts).watch();

  Future<void> addFavorite(FavoriteProductsCompanion product) {
    return into(favoriteProducts).insertOnConflictUpdate(product);
  }

  Future<void> removeFavorite(int id) {
    return (delete(favoriteProducts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<Order>> watchOrders() {
    return (select(orders)..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])).watch();
  }

  Future<void> addOrder(OrdersCompanion order) => into(orders).insert(order);
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'glowcart_database');
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
