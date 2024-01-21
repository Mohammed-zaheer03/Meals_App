import 'package:flutter/material.dart';

class Category {
  // Constructor function will be used to initialize these objects and set these properties
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
  final String id;
  final String title;
  final Color color;
}
