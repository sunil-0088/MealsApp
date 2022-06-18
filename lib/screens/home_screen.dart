import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/providers/favorite.dart';

import 'package:recipes_book/screens/category_overview_screen.dart';
import 'package:recipes_book/screens/favorites_screen.dart';
import 'package:recipes_book/widgets/app_drawer.dart';

// import '../providers/Categories.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  static const routeName = 'home_screen';
  int selectedPageIndex;

  MyHomePage({Key? key, required this.selectedPageIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloading = false;
  bool isStarting = true;
  bool isveg = true;

  final List<dynamic> _page = const [
    CategoryOverViewScreen(),
    FavoriteScreeen(),
  ];

  void _selectPage(index) {
    setState(() {
      widget.selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      isloading = true;
    });

    final mealProvider = Provider.of<AllMeals>(context, listen: false);

    mealProvider.fetchCloudData().then(
      (_) {
        mealProvider.setIsveg(isveg).then(
              (_) => Provider.of<Favorites>(context, listen: false)
                  .fetchAndSetData()
                  .then(
                    (_) => setState(
                      () {
                        isloading = false;
                      },
                    ),
                  ),
            );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final page = ModalRoute.of(context)?.settings.arguments as int;
    // if(page!=null){_selectedPageIndex = page;}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes Book'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Consumer<AllMeals>(
          builder: (context, value, child) => const AppDrawer()),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : _page[widget.selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Color.fromARGB(255, 232, 156, 115),
        // unselectedItemColor: Colors.white,
        currentIndex: widget.selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
