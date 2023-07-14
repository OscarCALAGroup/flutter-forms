import 'package:form_flutter/models/Users/users.dart';

class UsersMapper {
  static getList(List<dynamic> responseData) {
    List<Users> usersList = [];
    for (var item in responseData) {
      Users user = Users(
        user_id: item['user_id'],
        user_name: item['user_name'],
        user_email: item['user_email'],
        password: item['password'],
        token: item['token'],
        user_phone: item['user_phone'],
        user_status: item['user_status'],
        group_id: item['group_id'],
        creation_date: item['creation_date'] != null
            ? DateTime.parse(item['creation_date'])
            : null,
        last_update_user: item['last_update_user'],
        last_update_date: item['last_update_date'] != null
            ? DateTime.parse(item['last_update_date'])
            : null,
      );

      usersList.add(user);
    }

    return usersList;
  }
}
