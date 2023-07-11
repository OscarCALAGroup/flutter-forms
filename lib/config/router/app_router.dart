import 'package:form_flutter/screens/user_view.dart';
import 'package:form_flutter/screens/users.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const UsersScreen(),
    ),
    GoRoute(
      path: "/user_view",
      builder: (context, state) => const UsersView(),
    )
  ],
);
