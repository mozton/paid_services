import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paid_services/screens/add_paymet.dart';
import 'package:paid_services/screens/home_page_screen.dart';
import 'package:paid_services/screens/add_services_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePageScreen(),
    ),
    GoRoute(
      path: "add_payment",
      builder: (context, state) => const AddPaymetScreen(),
    ),
    GoRoute(
      path: "manage_services",
      builder: (context, state) => const AddServicesScreen(),
    ),
    GoRoute(
      path: "homepage",
      builder: (context, state) => const HomePageScreen(),
    ),
    // GoRoute(
    //   path: "homepage",
    //   builder: (context, state) => const DashboardScreen(),
    // ),
  ]);
}
