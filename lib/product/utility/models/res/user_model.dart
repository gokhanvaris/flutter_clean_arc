// lib/models/user.dart

import 'dart:convert';
import 'dart:typed_data';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  Uint8List toBytes() {
    return Uint8List.fromList(utf8.encode(json.encode(toJson())));
  }

  factory User.fromBytes(Uint8List bytes) {
    return User.fromJson(json.decode(utf8.decode(bytes)));
  }
}
