import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/services/users/users_service.dart';

final usersProvider = FutureProvider((ref) async {
  final usersService = UsersService();
  final users = await usersService.getUsers();

  return users;
});
