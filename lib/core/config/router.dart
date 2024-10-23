import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/offer/pages/offer_add_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'offer-add',
          builder: (context, state) => const OfferAddPage(),
        ),
      ],
    ),
  ],
);