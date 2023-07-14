import 'package:form_flutter/models/Groups/groups.dart';

class GroupsMapper {
  static getList(List<dynamic> responseData) {
    List<Groups> groupsList = [];

    for (var e in responseData) {
      Groups group = Groups(
        groupId: e['group_id'],
        groupName: e['group_name'],
        optionMenuId: e['option_menu_id'],
      );
      groupsList.add(group);
    }
    return groupsList;
  }
}
