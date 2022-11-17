import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seller_shop/global/global.dart';
import 'package:seller_shop/splash_Screen/splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sellers APP',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.brown,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(),
    );
  }
}
