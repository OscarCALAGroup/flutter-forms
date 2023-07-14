import 'package:form_flutter/screens/user_add.dart';
import 'package:form_flutter/screens/user_view.dart';
import 'package:form_flutter/screens/users.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const UsersScreen(),
      routes: [
        GoRoute(
          path: "user_view/:id",
          builder: (context, state) => UsersView(
            userId: state.pathParameters['id'] ?? 'no-id',
          ),
        ),
        GoRoute(
          path: 'users_add',
          builder: (context, state) => const AddUser(),
        )
      ],
    ),
  ],
);
