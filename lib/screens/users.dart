import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/models/Users/users.dart';
import 'package:form_flutter/providers/users_provider.dart';
import 'package:go_router/go_router.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersApp'),
        elevation: 10,
      ),
      body: const _UsersScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/users_add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _UsersScreen extends ConsumerWidget {
  const _UsersScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return Center(
      child: usersAsync.when(
          data: (value) => ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemCount: value!.length,
                itemBuilder: (context, index) {
                  final user = value[index];
                  return _CustomListTile(user: user);
                },
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
              ),
          error: ((error, stackTrace) => Text('$error')),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final Users user;

  const _CustomListTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.account_circle,
        size: 50,
      ),
      title: Text(user.user_name),
      subtitle: Text(user.user_email),
      onTap: () => context.push('user_view/${user.user_id}'),
    );
  }
}
