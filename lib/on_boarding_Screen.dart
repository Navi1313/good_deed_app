import 'package:flutter/material.dart';
import 'package:good_deed/homepage.dart';
import 'package:good_deed/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool onLastPage = false;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
   // final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: heightScreen * 0.1),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => onLastPage = index == 2);
          },
          children: const <Widget>[
            OnboardingContent(
              image: 'assets/images/handsTogether.png',
              heading: "Welcome to the Good Deed",
              description:
                  "This is the way we are connecting donors with the needed ",
            ),
            OnboardingContent(
              image: 'assets/images/boys.jpg',
              heading: "Get Started with one helping hand",
              description:
                  "This is the way we are connecting donors with the needed ",
            ),
            OnboardingContent(
              image: 'assets/images/childerns.jpg',
              heading: "Welcome to the Good Deed",
              description:
                  "This is the way we are connecting donors with the needed ",
            ),
          ],
        ),
      ),
      // Bottom Sheet to fill with container :->
      bottomSheet: onLastPage
          ? Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool('showHome', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 24,
                      color: ourColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : SizedBox(
              height: heightScreen * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 24, color: ourColor),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          dotColor: borderColor,
                          activeDotColor: ourColor,
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(
                            microseconds: 6,
                          ),
                          curve: Curves.easeInOut),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 24, color: ourColor),
                      ),
                    ),
                  ]),
            ),
    );
  }
}

// on boarding content class
class OnboardingContent extends StatelessWidget {
  final String image;
  final String heading;
  final String description;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.heading,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Displaying image
          Container(
            width: widthScreen,
            height: heightScreen * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: heightScreen * 0.05),

          // Displaying heading
          Text(
            heading,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: whiteColor,
            ),
          ),
          SizedBox(height: heightScreen * 0.03),

          // Displaying description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
