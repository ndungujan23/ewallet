import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ebank/src/features/index.dart';
import 'package:ebank/src/ui/widgets/index.dart';

enum AppRoute {
  auth,
  dashboard,
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sHomeNavigatorKey = GlobalKey<NavigatorState>();
final _sExploreNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return LayoutDashboard(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(navigatorKey: _sHomeNavigatorKey, routes: [
              GoRoute(
                path: '/',
                // name: AppRoute.dashboard.name,
                pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardScreen()),
              )
            ]),
          ])
    ]);

final goRouterProvider = Provider<GoRouter>((ref) => goRouter);
