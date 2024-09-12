import 'package:flutter/material.dart';
import 'package:good_deed/splash.dart';
import 'package:good_deed/pallete.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Narva' ,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.blackColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.blackColor,
        )
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
