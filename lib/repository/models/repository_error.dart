import 'dart:convert';

RepositoryError userErrorFromJson(String str) => RepositoryError.fromJson(
      json.decode(str),
    );

String userErrorToJson(RepositoryError data) => json.encode(data.toJson());

class RepositoryError {
  RepositoryError({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory RepositoryError.fromJson(Map<String, dynamic> json) =>
      RepositoryError(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
