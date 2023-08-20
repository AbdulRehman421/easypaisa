import 'package:easypaisa/HomePage.dart';
import 'package:easypaisa/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/sharedprefrence.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPrefClass.preferences = await SharedPreferences.getInstance();
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
