import 'package:flutter/material.dart';
import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealPro = Provider.of<AllMeals>(context);
    final isveg = mealPro.getIsveg;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text(
              'Meals',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyHomePage(selectedPageIndex: 0),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text(
              'Favotire',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyHomePage(selectedPageIndex: 1),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text(
              'OnlyVeg',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Consumer<AllMeals>(
              builder: (context, value, _) => Switch(
                activeColor: Colors.green,
                value: isveg,
                onChanged: (value) {
                  mealPro.setIsveg(value);
                },
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text(
              'Rate Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text(
              'Share This App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
        ],
      ),
    );
  }
}
