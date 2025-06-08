
import 'package:go_router/go_router.dart';


import 'features/home/ui/home_page.dart';
import 'features/auth/ui/login_page.dart';
import 'features/auth/ui/register_page.dart';
import 'features/product/ui/product_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ProductPage(product: extra);
      },
    ),
  ],
);

/// Espone il router usato da MyApp
GoRouter get appRouter => _router;
