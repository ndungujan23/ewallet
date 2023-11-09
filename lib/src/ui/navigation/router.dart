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
final _dashboardNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: '/auth',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          return const GetStartedScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'signin',
            builder: (context, state) {
              return const SignInScreen();
            },
          ),
          GoRoute(
            path: 'signup',
            builder: (context, state) {
              return const SignUpScreen();
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return LayoutDashboard(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(navigatorKey: _dashboardNavigatorKey, routes: [
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
