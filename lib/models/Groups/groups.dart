// To parse this JSON data, do
//
//     final groups = groupsFromJson(jsonString);

import 'dart:convert';

List<Groups> groupsFromJson(String str) => List<Groups>.from(json.decode(str).map((x) => Groups.fromJson(x)));

String groupsToJson(List<Groups> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Groups {
    int groupId;
    String groupName;
    int optionMenuId;
    DateTime? creationDate;
    String? lastUpdateUser;
    DateTime? lastUpdateDate;

    Groups({
        required this.groupId,
        required this.groupName,
        required this.optionMenuId,
        this.creationDate,
        this.lastUpdateUser,
        this.lastUpdateDate,
    });

    factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        groupId: json["group_id"],
        groupName: json["group_name"],
        optionMenuId: json["option_menu_id"],
        creationDate: json["creation_date"] == null ? null : DateTime.parse(json["creation_date"]),
        lastUpdateUser: json["last_update_user"],
        lastUpdateDate: json["last_update_date"] == null ? null : DateTime.parse(json["last_update_date"]),
    );

    Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "group_name": groupName,
        "option_menu_id": optionMenuId,
        "creation_date": creationDate?.toIso8601String(),
        "last_update_user": lastUpdateUser,
        "last_update_date": lastUpdateDate?.toIso8601String(),
    };
}