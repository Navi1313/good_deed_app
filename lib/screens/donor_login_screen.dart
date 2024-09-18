import 'package:flutter/material.dart';
import 'package:good_deed/global_variables.dart';
import 'package:good_deed/pallete.dart';
import 'package:good_deed/screens/donor_signup_screen.dart';
import 'package:good_deed/widgets/text_inputfield.dart';

class DonorLoginScreen extends StatefulWidget {
  const DonorLoginScreen({
    super.key,
  });

  @override
  State<DonorLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DonorLoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  // Declare isHovered at the state level
  bool isHovered = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
  }

  // void loginUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   String res = await Authentication().loginUser(
  //       email: _emailEditingController.text,
  //       password: _passwordEditingController.text
  //       );
  //   if (res == "Success") {
  //     // Navigate to the Home_Screen :->
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const ResponsiveLayout(
  //                   mobileScreenLayout: MobileScreen(),
  //                   webScreenLayout: WebScreen())));
  //   } else {
  //     showSnackBar(res, context);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: widthScreen > webScreenSize
              ? EdgeInsets.symmetric(horizontal: widthScreen / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              // image
              Center(
                child: Image.asset(
                  'assets/images/circleIcon.png',
                  width: 150, // Set the desired width
                  height: 150, // Set the desired height
                  fit: BoxFit.cover, // Adjust the fit property if necessary
                ),
              ),
              const SizedBox(height: 64),

              // Input for email
              TextInputfield(
                hintText: "  Enter Your Email",
                textEditingController: _emailEditingController,
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 24),

              // Input for Password
              TextInputfield(
                hintText: "  Enter Your Password",
                isPass: true,
                textEditingController: _passwordEditingController,
                textInputType: TextInputType.text,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 32),

              // Log In button
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  // Apply a gradient using BoxDecoration
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        ourColor,
                        Color.fromRGBO(19, 129, 141, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              Flexible(flex: 2, child: Container()),

              // Transition to sign up screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account? "),
                  ),
                  MouseRegion(
                    onEnter: (_) =>
                        setState(() => isHovered = true), // On hover
                    onExit: (_) =>
                        setState(() => isHovered = false), // On hover exit
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonorSignupScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          " Sign up.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isHovered
                                ? const Color.fromARGB(255, 62, 155, 232)
                                : const Color.fromARGB(255, 255, 255,
                                    255), // Change color on hover
                            fontSize:
                                isHovered ? 17 : 15, // Change size on hover
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
