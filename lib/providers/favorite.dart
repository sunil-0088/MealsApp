
import 'package:flutter/material.dart';
import 'package:recipes_book/helper/db_helper.dart';

class Favorites with ChangeNotifier {
  List<String> _fav = [];
  final favTable = 'user_fav';

  List<String> get getfavorites {
    return _fav;
  }

  Future<void> fetchAndSetData() async {
    final data = await DBHelper.getData(favTable);
    _fav=data.map((item) =>item['id']).toList().cast<String>();
  }

  Future<void> addAndRemoveFavorite(String mealId) async {
    if (_fav.contains(mealId)) {
      _fav.remove(mealId);
      DBHelper.remove(favTable, mealId);
    } else {
      _fav.insert(0, mealId);
      DBHelper.insert(
        favTable,
        {'id': mealId, },
      );
    }

    notifyListeners();
  }

  bool isfav(String mealId) {
    if (_fav.contains(mealId)) {
      return true;
    } else {
      return false;
    }
  }
}
