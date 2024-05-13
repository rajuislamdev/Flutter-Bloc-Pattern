import 'package:bloc_practice/screens/comment/comment_screen.dart';
import 'package:bloc_practice/screens/dashboard/dashboard_screen.dart';
import 'package:bloc_practice/screens/post/post_screen.dart';
import 'package:bloc_practice/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();
  static const dashboard = '/dashboard';
  static const user = '/user';
  static const post = '/post';
  static const comment = '/comment';
}

final _globalNvigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _globalNvigatorKey,
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: Routes.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: Routes.user,
      builder: (context, state) => const UserScreen(),
    
    ),
    GoRoute(
      path: Routes.post,
      builder: (context, state) => const PostScreen(),
    ),
    GoRoute(
      path: Routes.comment,
      builder: (context, state) => const CommentScreen(),
    ),
  ],
);
