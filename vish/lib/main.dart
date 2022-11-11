import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: "Vish-virtual shop",
      home: const CartScreen(),
      theme: Theme.of(context).copyWith(
          primaryColor: const Color(0xFFf65c05),
          textTheme: const TextTheme(
              headline2: TextStyle(
                fontSize: 14,
                fontFamily: "Acme",
                color: Colors.black,
              ),
              headline1: TextStyle(
                  fontSize: 12, fontFamily: "Acme", color: Colors.grey))),
    );
  }
}
