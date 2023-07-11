import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/services/users.dart';

final UsersProvider = FutureProvider((ref) async {

  final name = UsersService.getUser(1);

  return name;
});