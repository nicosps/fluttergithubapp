import 'dart:convert';

UserContributorError userErrorFromJson(String str) => UserContributorError.fromJson(json.decode(str));

String userErrorToJson(UserContributorError data) => json.encode(data.toJson());

class UserContributorError {
  UserContributorError({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory UserContributorError.fromJson(Map<String, dynamic> json) => UserContributorError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
