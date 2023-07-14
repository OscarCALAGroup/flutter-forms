// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int user_id;
  String user_name;
  String user_email;
  String password;
  dynamic token;
  String user_phone;
  bool user_status;
  int? group_id;
  DateTime? creation_date;
  String? last_update_user;
  DateTime? last_update_date;

  Users({
    required this.user_id,
    required this.user_name,
    required this.user_email,
    required this.password,
    this.token,
    required this.user_phone,
    required this.user_status,
    required this.group_id,
    this.creation_date,
    this.last_update_user,
    this.last_update_date,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        user_id: json["user_id"],
        user_name: json["user_name"],
        user_email: json["user_email"],
        password: json["password"],
        token: json["token"],
        user_phone: json["user_phone"],
        user_status: json["user_status"],
        group_id: json["group_id"],
        creation_date: DateTime.parse(json["creation_date"]),
        last_update_user: json["last_update_user"],
        last_update_date: DateTime.parse(json["last_update_date"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "user_name": user_name,
        "user_email": user_email,
        "password": password,
        "token": token,
        "user_phone": user_phone,
        "user_status": user_status,
        "group_id": group_id,
        "creation_date": creation_date!.toIso8601String(),
        "last_update_user": last_update_user,
        "last_update_date": last_update_date!.toIso8601String(),
      };

}

class ResponseUsers {
  final List<Users> data;

  ResponseUsers({required this.data});

  factory ResponseUsers.fromJsonResponse(Map<String, dynamic> json) {
    final List<dynamic> userData = json['data'];
    final List<Users> users = userData.map((userJson) => Users.fromJson(userJson)).toList();

    return ResponseUsers(data: users);
  }
}
