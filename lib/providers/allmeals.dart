import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:recipes_book/providers/meal.dart';

class AllMeals with ChangeNotifier {
  List<Meal> _allMeal = [];
  late bool _isveg;

  Future<void> fetchAndSetData() async {
    if (_allMeal.isEmpty) {
      final url = Uri.parse(
          'https://recipes-book-19afe-default-rtdb.firebaseio.com/product.json');

      try {
        final response = await http.get(url);
        final extractData = json.decode(response.body) as Map<String, dynamic>;

        extractData.forEach(
          (mealId, document) {
            _allMeal.add(Meal(
                id: mealId,
                categories: document['categoris'].cast<String>(),
                title: document['title'],
                imageUrl: document['imageUrl'],
                ingredients: document['ingredients'].cast<String>(),
                steps: document['step'].cast<String>(),
                duration: document['duretion'],
                complexity: document['complexity'],
                isVeg: document['isVeg']));
          },
        );
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
    return;
  }

  Future<void> fetchCloudData() async {
    if (_allMeal.isEmpty) {
      FirebaseFirestore.instance
          .collection("All Meal")
          .snapshots()
          .listen((data) {
        for (var document in data.docs) {
          _allMeal.add(Meal(
              id: document.id,
              categories: document['categoris'].cast<String>(),
              title: document['title'],
              imageUrl: document['imageUrl'],
              ingredients: document['ingredients'].cast<String>(),
              steps: document['step'].cast<String>(),
              duration: document['duretion'],
              complexity: document['complexity'],
              isVeg: document['isVeg']));
        }
      });
    }
    return;
  }

  List<Meal> get getMeals {
    if (_isveg) {
      return _allMeal.where((meal) => meal.isVeg == true).toList();
    } else {
      return [..._allMeal];
    }
  }

  List<Meal> findByCategory(String category) {
    if (_isveg) {
      return _allMeal.where((meal) {
        return (meal.categories.contains(category) && meal.isVeg);
      }).toList();
    } else {
      return _allMeal.where((meal) {
        return meal.categories.contains(category);
      }).toList();
    }
  }

  Meal findById(String id) {
    return _allMeal.firstWhere((meal) => meal.id == id);
  }

  Future<void> setIsveg(bool value) async {
    _isveg = value;
    notifyListeners();
  }

  bool get getIsveg {
    return _isveg;
  }
}
