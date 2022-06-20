import 'dart:convert';

class UserFields {
  static const String id = 'id';
  static const String email = 'email';
  static const String name = 'name';
  static const String isNoob = 'isNoob';

  static List<String> getFields() => [id, email, name, isNoob];
}

class User {
  final int? id;
  final String name;
  final String email;
  final String isNoob;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.isNoob,
  });

  User copy({
    int? id,
    String? vi,
    String? en,
  }) =>
      User(
        id: id ?? this.id,
        name: vi ?? this.name,
        email: vi ?? this.email,
        isNoob: vi ?? this.isNoob,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: jsonDecode(json[UserFields.id]),
        name: json[UserFields.name],
        email: json[UserFields.email],
        isNoob: json[UserFields.isNoob],
      );

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.isNoob: isNoob,
      };
}
