import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vish-virtual shop",
      home: const HomeScreen(),
      theme: Theme.of(context).copyWith(
          primaryColor: const Color(0xFFf65c05),
          textTheme: const TextTheme(
              headline4: TextStyle(
                  color: Color(0xFFf65c05),
                  fontFamily: "Cherry Bomb",
                  fontSize: 24),
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
