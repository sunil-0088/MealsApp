import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes_book/providers/allmeals.dart';
import 'package:recipes_book/providers/categories.dart';

import 'package:recipes_book/providers/favorite.dart';
import 'package:recipes_book/screens/auth_screen.dart';
import 'package:recipes_book/screens/category_meals_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:recipes_book/screens/home_screen.dart';
import 'package:recipes_book/screens/meal_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Categories()),
        ChangeNotifierProvider(create: (context) => Favorites()),
        ChangeNotifierProvider(create: (context) => AllMeals()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipes Book',
        theme: ThemeData(
            // useMaterial3: true,
            fontFamily: GoogleFonts.karma().fontFamily,
            primaryColor: Color.fromARGB(255, 232, 156, 115),
            appBarTheme:
                AppBarTheme(color: Color.fromARGB(255, 232, 156, 115))),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                return MyHomePage(selectedPageIndex: 0);
              }
              return AuthScreen();
            }),
        // MyHomePage(selectedPageIndex: 0,)
        routes: {
          CategoryMealsScreen.routeName: (context) =>
              const CategoryMealsScreen(),
          MealsDetailScreen.rounteName: (context) => const MealsDetailScreen(),
          MyHomePage.routeName: (context) => MyHomePage(
                selectedPageIndex: 1,
              ),
        },
      ),
    );
  }
}
