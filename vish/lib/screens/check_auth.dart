import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth_provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class CheckAuth extends StatelessWidget {
  bool? isLoggedIn;

  void _checkIfLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    isLoggedIn = prefs.getBool("loggedIn");
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    _checkIfLoggedIn();

    return auth.userIsAuthenticated
        ? const HomeScreen()
        : isLoggedIn ?? false
            ? const HomeScreen()
            : LoginScreen();
  }
}
