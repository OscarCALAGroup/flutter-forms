import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/providers/users_provider.dart';
import 'package:go_router/go_router.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersApp'),
      ),
      body: const _UsersScreen(),
    );
  }
}

class _UsersScreen extends ConsumerWidget {
  const _UsersScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(UsersProvider);

    return ListView(
      children: const [
        _CustomListTile(
            title: "Oscar", subTitle: "Correo", location: "/user_view")
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.account_circle, size: 40,),
        title: Text(title),
        subtitle: Text(subTitle),
        onTap: () {
          context.push(location);
        });
  }
}
