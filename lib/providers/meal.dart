import 'package:flutter/cupertino.dart';

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int? duration;
  final String complexity;
   bool isFavorite;
  final bool isVeg;
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    this.isFavorite = false,
    required this.isVeg,
  });
}

