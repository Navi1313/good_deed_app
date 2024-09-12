import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:good_deed/homepage.dart';
import 'package:good_deed/pallete.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    });
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
                      color: Pallete.ourColor,
                      fontSize: widths * 0.10, // 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: heights * 0.01),
                SpinPerfect(
                  child: Image.asset('assets/images/logodark.png',
                      height: heights * 0.6,
                      width: widths * 0.6,
                      fit: BoxFit.contain),
                ),
                SizedBox(height: heights * 0.03),
                FadeInRight(
                  child: Text(
                    'Connecting Hands Together',
                    style: TextStyle(
                      color: Pallete.ourColor,
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
