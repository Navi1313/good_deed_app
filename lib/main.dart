import 'package:flutter/material.dart';
import 'package:good_deed/screens/role_screen.dart';
import 'package:good_deed/pallete.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Narva',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: blackColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: blackColor,
          )),
      home: const RoleScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
