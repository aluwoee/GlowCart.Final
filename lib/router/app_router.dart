import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/cart/presentation/pages/cart_page.dart';
import '../features/favorites/presentation/pages/favorites_page.dart';
import '../features/orders/presentation/pages/orders_page.dart';
import '../features/products/presentation/pages/home_page.dart';
import '../features/products/presentation/pages/product_details_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: _RouterRefreshStream(ref.watch(firebaseAuthProvider).authStateChanges()),

    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isGoingToLogin = state.matchedLocation == '/login';

      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }

      if (isLoggedIn && isGoingToLogin) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/',
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'product/:id',
            name: ProductDetailsPage.routeName,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return ProductDetailsPage(productId: id);
            },
          ),
          GoRoute(
            path: 'cart',
            name: CartPage.routeName,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: 'favorites',
            name: FavoritesPage.routeName,
            builder: (context, state) => const FavoritesPage(),
          ),
          GoRoute(
            path: 'orders',
            name: OrdersPage.routeName,
            builder: (context, state) => const OrdersPage(),
          ),
          GoRoute(
            path: 'settings',
            name: SettingsPage.routeName,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
});

class _RouterRefreshStream extends ChangeNotifier {
  _RouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}