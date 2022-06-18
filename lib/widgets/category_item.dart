import 'package:flutter/material.dart';

// import 'package:recipes_book/providers/category.dart';
import '../providers/categories.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category cat;

  const CategoryItem({Key? key, required this.cat}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(
          CategoryMealsScreen.routeName,
          arguments: {'id': cat.id, 'title': cat.title},
        )
      },
      child: Container(
        width: 110,
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
        decoration: BoxDecoration(
          // color: color,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [cat.color.withOpacity(0.3), cat.color.withOpacity(0.8)],
          ),
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(7, 7),
          //     blurRadius: 5,
          //     color: Color.fromARGB(255, 232, 156, 115),
          //   ),
          // ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(cat.image),
              ),
            ),
            Spacer(),
            Text(
              cat.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
