import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipes_book/providers/meal.dart';

import '../providers/favorite.dart';
import '../screens/meal_detail_screen.dart';

class MealsItem extends StatefulWidget {
  const MealsItem({Key? key}) : super(key: key);

  @override
  State<MealsItem> createState() => _MealsItemState();
}

class _MealsItemState extends State<MealsItem> {
  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context);
    final favorites = Provider.of<Favorites>(context);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(MealsDetailScreen.rounteName, arguments: meal.id),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: SizedBox(
          height: 110,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: primeColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: meal.id,
                        child: FadeInImage(
                          placeholder:
                              const AssetImage('assets/images/meal.png'),
                          image: NetworkImage(meal.imageUrl),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(meal.title,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.remove_red_eye,
                                  // color: textColor,
                                  size: 15,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  '278 views',
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.schedule,
                                  // color: textColor,
                                  size: 15,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  '15 min',
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                top: 0,
                right: -5,
                child: IconButton(
                  splashRadius: 1,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 207, 206, 206),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return InkWell(
    //   onTap: () => Navigator.of(context)
    //       .pushNamed(MealsDetailScreen.rounteName, arguments: meal.id),
    //   child: Card(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //     elevation: 5,
    //     margin: const EdgeInsets.all(10),
    //     child: Column(
    //       children: <Widget>[
    //         Stack(
    //           children: <Widget>[
    //             ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(15),
    //                 topRight: Radius.circular(15),
    //               ),
    //   child: Hero(
    //     tag: meal.id,
    //     child: FadeInImage(
    //       placeholder: const AssetImage('assets/images/meal.png'),
    //       image: NetworkImage(meal.imageUrl),
    //       height: 200,
    //       width: double.infinity,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // ),
    //             Positioned(
    //               bottom: 20,
    //               right: 0,
    //               child: Container(
    //                 width: 250,
    //                 color: Colors.black54,
    //                 padding: const EdgeInsets.symmetric(
    //                   vertical: 5,
    //                   horizontal: 10,
    //                 ),
    //                 child: Text(
    //                   meal.title,
    //                   style: const TextStyle(
    //                       fontSize: 25,
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold),
    //                   softWrap: true,
    //                   overflow: TextOverflow.fade,
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               top: 10,
    //               right: 10,
    //               child: Consumer<Favorites>(
    //                 builder: (context, value, _) {
    //                   return IconButton(
    //                     icon: favorites.isfav(meal.id)
    //                         ? const Icon(
    //                             Icons.favorite,
    //                             color: Colors.red,
    //                           )
    //                         : const Icon(
    //                             Icons.favorite,
    //                             color: Colors.white,
    //                           ),
    //                     iconSize: 40,
    //                     onPressed: () =>
    //                         favorites.addAndRemoveFavorite(meal.id),
    //                   );
    //                 },
    //               ),
    //             )
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(15),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: <Widget>[
    //                   const Icon(Icons.schedule),
    //                   const SizedBox(width: 6),
    //                   Text('${meal.duration.toString()} min')
    //                 ],
    //               ),
    //               Row(
    //                 children: <Widget>[
    //                   const Icon(Icons.work),
    //                   const SizedBox(width: 6),
    //                   Text(meal.complexity)
    //                 ],
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
