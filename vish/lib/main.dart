import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/products_provider.dart';
import 'screens/categories_screen.dart';
import 'screens/category_products_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsProvider>(
        create: (_) => ProductsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Vish-virtual shop",
          initialRoute: "/",
          theme: Theme.of(context).copyWith(
            primaryColor: const Color(0xFFf65c05),
            textTheme: const TextTheme(
              headline2: TextStyle(
                fontSize: 14,
                fontFamily: "Acme",
                color: Colors.black,
              ),
              headline1: TextStyle(
                  fontSize: 12, fontFamily: "Acme", color: Colors.grey),
            ),
          ),
          routes: {
            "/": (context) => const HomeScreen(),
            "/search-results": (context) => const SearchResultsScreen(),
            "/categorias": (context) => CategoriesScreen(),
            "/categoria-produtos": (context) => const CategoryProductsScreen(),
          },
        ));
  }
}
