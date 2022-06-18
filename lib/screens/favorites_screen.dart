import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/providers/favorite.dart';

import '../providers/allmeals.dart';
import '../widgets/meals_item.dart';

class FavoriteScreeen extends StatelessWidget {
  const FavoriteScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<Favorites>(context).getfavorites;
    final allMeals = Provider.of<AllMeals>(context, listen: false);
    final favMeals = favorites
        .map(
          (e) => allMeals.findById(e),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
      child: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: favMeals[index],
          child: const MealsItem(),
        ),
      ),
    );
  }
}
