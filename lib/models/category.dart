//blueprint of how the grid must look like in this meal_app
import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.redAccent,
  });

  final String id;
  final String title;
  final Color color;
}
