import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:good_deed/homepage.dart';
import 'dart:async';
import 'package:good_deed/on_boarding_screen.dart';
import 'package:good_deed/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    // Simulate some delay for splash screen (e.g., 3 seconds)
    await Future.delayed(const Duration(seconds: 3));

    // Check if onboarding has been completed using SharedPreferences
    final pref = await SharedPreferences.getInstance();
    final showHome = pref.getBool('showHome') ?? false;

    // Navigate based on onboarding completion status
    if (showHome) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heights * 0.06),
                FadeInLeft(
                  child: Text(
                    'GOOD DEED',
                    style: TextStyle(
                      color: ourColor,
                      fontSize: widths * 0.10, //
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: heights * 0.01),
                Spin(
                  child: Image.asset('assets/images/icon.png',
                      height: heights * 0.3,
                      width: widths * 0.3,
                      fit: BoxFit.contain),
                ),
                SizedBox(height: heights * 0.03),
                FadeInRight(
                  child: Text(
                    'Connecting Hands Together',
                    style: TextStyle(
                      color: ourColor,
                      fontSize: widths * 0.05, // 5% of the screen width
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MeaCulpa',
                    ),
                  ),
                ),
                SizedBox(height: heights * 0.03),
              ],
            ),
          )),
    );
  }
}
