// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

UserContext userContextFromJson(String? str) =>
    UserContext.fromJson(json.decode(str!));

String userContextToJson(UserContext data) => json.encode(data.toJson());

class UserContext {
  int user_id;
  String user_name;
  String user_email;
  String password;
  bool user_status;
  int? group_id;

  UserContext(
      {required this.user_id,
      required this.user_name,
      required this.user_email,
      required this.password,
      required this.user_status,
      this.group_id});

  factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
        user_id: json["user_id"],
        user_name: json["user_name"],
        user_email: json["user_email"],
        password: json["password"],
        user_status: json["user_status"],
        group_id: json["group_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "user_name": user_name,
        "user_email": user_email,
        "password": password,
        "user_status": user_status,
        "group_id": group_id,
      };
}
