import 'package:flutter/material.dart';

// import 'package:recipes_book/providers/category.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
    this.color = Colors.orange,
  });
}

class Categories with ChangeNotifier {
  final List<Category> _categories = [
    Category(
        id: 'c1',
        title: 'All Recipes',
        color: Colors.teal,
        image: 'assets/images/all.png'),
    Category(
        id: 'c2',
        title: 'NON VEGETARIAN',
        color: Colors.redAccent,
        image: 'assets/images/non vegetarian.png'),
    Category(
        id: 'c3',
        title: 'VEGETARIAN',
        color: Colors.lightGreen,
        image: 'assets/images/vegetarian.png'),
    Category(
        id: 'c4',
        title: 'SNACKS',
        color: Colors.green,
        image: 'assets/images/snacks.png'),
    Category(
        id: 'c5',
        title: 'CAKES',
        color: Colors.orange,
        image: 'assets/images/cake.png'),
    Category(
        id: 'c6',
        title: 'SWEETS',
        color: Colors.amber,
        image: 'assets/images/sweet.png'),
  ];

  List<Category> get getCategories {
    return [..._categories];
  }
}
