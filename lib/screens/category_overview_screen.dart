// import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:recipes_book/providers/allmeals.dart';

import 'package:recipes_book/providers/categories.dart';
import 'package:recipes_book/widgets/category_item.dart';

import '../widgets/slider_item.dart';

class CategoryOverViewScreen extends StatelessWidget {
  const CategoryOverViewScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text, bool isveg) {
    return Column(
      children: [
        Divider(
          thickness: 2,
          color: isveg ? Colors.green : Colors.red,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3.5),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Divider(
          thickness: 2,
          color: isveg ? Colors.green : Colors.red,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<AllMeals>(context);
    final isveg = mealProvider.getIsveg;
    final allMeals = mealProvider.getMeals;
    final catsData = Provider.of<Categories>(context).getCategories;
    final avalibleCat =
        isveg ? catsData.where((cat) => cat.id != 'c2').toList() : catsData;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionTitle(context, 'Categories', isveg),
            SizedBox(
              height: 120,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemCount: avalibleCat.length,
                  itemBuilder: (BuildContext ctx, index) =>
                      CategoryItem(cat: avalibleCat[index])),
            ),
            buildSectionTitle(context, 'Today\'s Recipes', isveg),
            CarouselSlider(
              // carouselController: CarouselController(),
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),

              items: allMeals
                  .map(
                    (meal) => SliderItem(
                        id: meal.id,
                        title: meal.title,
                        imageUrl: meal.imageUrl),
                  )
                  .toList(),
            ),
            buildSectionTitle(context, 'Spacial', isveg),
            CarouselSlider(
              // carouselController: CarouselController(),
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),

              items: allMeals
                  .map(
                    (meal) => SliderItem(
                        id: meal.id,
                        title: meal.title,
                        imageUrl: meal.imageUrl),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
