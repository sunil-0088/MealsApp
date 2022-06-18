import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/widgets/app_drawer.dart';
import 'package:recipes_book/widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categoryMeals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryDetail =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final categoryId = categoryDetail['id'];
    final categoryTitle = categoryDetail['title'] as String;

    final categoryMeals =
        Provider.of<AllMeals>(context).findByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      // ignore: prefer_const_constructors
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: categoryMeals[index],
          child: const MealsItem(),
        ),
      ),
    );
  }
}
