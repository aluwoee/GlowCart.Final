import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../products/domain/entities/product.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final ordersProvider = StreamProvider<List<Order>>((ref) {
  return ref.watch(databaseProvider).watchOrders();
});

final cloudOrdersProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) return const Stream.empty();

  return firestore
      .collection('users')
      .doc(user.uid)
      .collection('orders')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => doc.data()).toList());
});

final ordersControllerProvider = Provider<OrdersController>((ref) {
  return OrdersController(
    ref.watch(databaseProvider),
    ref.watch(firestoreProvider),
  );
});

class OrdersController {
  const OrdersController(this._database, this._firestore);

  final AppDatabase _database;
  final FirebaseFirestore _firestore;

  Future<void> createOrder(List<Product> products) async {
    if (products.isEmpty) return;

    final titles = products.map((p) => p.title).join(', ');
    final total = products.fold<double>(0, (sum, p) => sum + p.price);
    final now = DateTime.now();

    await _database.addOrder(
      OrdersCompanion.insert(
        productTitles: titles,
        totalPrice: total,
        createdAt: now,
      ),
    );

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('orders')
          .add({
        'productTitles': titles,
        'totalPrice': total,
        'createdAt': Timestamp.fromDate(now),
        'userId': user.uid,
      });
    }
  }
}