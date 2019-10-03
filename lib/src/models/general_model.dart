import 'package:flutter/material.dart';

@immutable
class Links {
  final String first;
  final String last;
  final String prev;
  final String next;

  Links(this.first, this.last, this.prev, this.next);

  static Links fromJson(Map<String, dynamic> parsedJson) {
    return Links(
      parsedJson["first"],
      parsedJson["last"],
      parsedJson["prev"],
      parsedJson["next"],
    );
  }
}

@immutable
class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta(this.currentPage, this.from, this.lastPage, this.path, this.perPage,
      this.to, this.total);

  static Meta fromJson(Map<String, dynamic> parsedJson) {
    return Meta(
      parsedJson["current_page"],
      parsedJson["from"],
      parsedJson["last_page"],
      parsedJson["path"],
      parsedJson["per_page"],
      parsedJson["to"],
      parsedJson["total"],
    );
  }
}
