import 'package:flutter/material.dart';

@immutable
class Mitfahrbank {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Mitfahrbank(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  static Mitfahrbank fromJson(Map<String, dynamic> parsedJson) {
    return Mitfahrbank(
      parsedJson["id"],
      parsedJson["name"],
      parsedJson["created_at"],
      parsedJson["updated_at"],
    );
  }
}
