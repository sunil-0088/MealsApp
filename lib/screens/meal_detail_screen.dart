import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/providers/favorite.dart';

class MealsDetailScreen extends StatefulWidget {
  static const String rounteName = '/meals-detail';

  const MealsDetailScreen({Key? key}) : super(key: key);

  @override
  State<MealsDetailScreen> createState() => _MealsDetailScreenState();
}

class _MealsDetailScreenState extends State<MealsDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        Provider.of<AllMeals>(context, listen: false).findById(mealId);
    final favorites = Provider.of<Favorites>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Share'),
                    )
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Hero(
                tag: mealId,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                  const Divider()
                ],
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
            buildSectionTitle(context, 'Steps'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 10,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Consumer<Favorites>(
          builder: ((context, value, _) {
            return Icon(
              favorites.isfav(selectedMeal.id)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.red[300],
              size: 30,
            );
          }),
        ),
        onPressed: () => favorites.addAndRemoveFavorite(selectedMeal.id),
      ),
    );
  }
}
