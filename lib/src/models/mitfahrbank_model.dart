import 'package:flutter/material.dart';

import './user_model.dart';

@immutable
class Mitfahrbank {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;

  Mitfahrbank(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
      this.pivot,
  );

  static Mitfahrbank fromJson(Map<String, dynamic> parsedJson) {
    return Mitfahrbank(
      parsedJson["id"],
      parsedJson["name"],
      parsedJson["created_at"],
      parsedJson["updated_at"],
      parsedJson["pivot"] != null ? Pivot.fromJson(parsedJson["pivot"]) : null,
    );
  }
}
