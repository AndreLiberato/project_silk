import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

initConfiguration() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
}
