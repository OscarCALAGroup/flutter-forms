import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersView extends ConsumerStatefulWidget {
  final String userId;
  const UsersView({super.key, required this.userId});

  @override
  UsersViewState createState() => UsersViewState();
}

class UsersViewState extends ConsumerState<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Center(
        child: Text(widget.userId),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
