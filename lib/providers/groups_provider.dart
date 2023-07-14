import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_flutter/services/groups/groups_service.dart';

final groupsProvider = FutureProvider((ref) async {
  final groupsService = GroupsService();
  final groups = await groupsService.getGroups();

  return groups;
});