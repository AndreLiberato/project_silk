import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vish/providers/groceries_lists_provider.dart';

import 'providers/products_provider.dart';
import 'screens/categories_screen.dart';
import 'screens/category_products_screen.dart';
import 'screens/home_screen.dart';
import 'screens/list_form_screen.dart';
import '../screens/list_details_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/search_results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductsProvider>(
            create: (_) => ProductsProvider(),
          ),
          ChangeNotifierProvider<GroceriesListsProvider>(
              create: (_) => GroceriesListsProvider())
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          title: "Vish-virtual shop",
          initialRoute: "/",
          theme: Theme.of(context).copyWith(
            primaryColor: const Color(0xFFf65c05),
            textTheme: const TextTheme(
              headline4: TextStyle(
                  fontSize: 30, color: Colors.black, fontFamily: "Acme"),
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
            "/detalhe-produto": (context) => const ProductDetailScreen(),
            "/lista-form": (context) => const ListFormScreen(),
            "/lista-detalhes": (context) => const ListDetailsScreen()
          },
        ));
  }
}
