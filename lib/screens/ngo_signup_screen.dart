import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_deed/pallete.dart';
import 'package:good_deed/screens/ngo_login_screen.dart';
import 'package:good_deed/utils/util.dart';
import 'package:good_deed/widgets/text_inputfield.dart';
import 'package:image_picker/image_picker.dart';

class NgoSignupScreen extends StatefulWidget {
  const NgoSignupScreen({
    super.key,
  });

  @override
  State<NgoSignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<NgoSignupScreen>
    with TickerProviderStateMixin {
  // Adding an Linear Progress Indicator
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    super.initState();
  }

  bool isHovered = false;
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;
  bool screenLine = false;
  bool isProgress = false;

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  // void signUpUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Uint8List imageToUpload;
  //   // Check if the user has selected an image, else load the default image
  //   if (_image == null) {
  //     ByteData byteData = await rootBundle.load('assets/images/user.jpg');
  //     imageToUpload = byteData.buffer.asUint8List();
  //   } else {
  //     imageToUpload = _image!;
  //   }
  //   String res = await Authentication().signUpUser(
  //       username: _usernameController.text,
  //       email: _emailEditingController.text,
  //       password: _passwordEditingController.text,
  //       bio: _bioController.text,
  //       file: imageToUpload);

  //   setState(() {
  //     isLoading = false;
  //   });
  //   if (res != 'Success') {
  //     showSnackBar(res, context);
  //   } else {
  //     setState(() {
  //       isProgress = true;
  //     });
  //     controller.forward();
  //     Timer(const Duration(seconds: 3), () {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    //final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isProgress)
              LinearProgressIndicator(
                value: controller.value,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(ourColor),
              ),

            //Flexible(flex: 2, child: Container()),
            SizedBox(height: heightScreen * 0.15),
            // svg image
            const Center(
              child: Text(
                "Good Deed",
                style: TextStyle(
                    fontSize: 25, color: ourColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: heightScreen * 0.05),

            // Field for Avatar :->
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            SizedBox(height: heightScreen * 0.03),

            // Input for username ,
            TextInputfield(
                hintText: "  Enter your username",
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                prefixIcon: const Icon(Icons.account_circle_sharp)),

            SizedBox(height: heightScreen * 0.02),

            // Input for Pemail
            TextInputfield(
                hintText: "  Enter Your Email",
                textEditingController: _emailEditingController,
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined)),

            SizedBox(height: heightScreen * 0.02),

            TextInputfield(
                hintText: "  Enter Your Password",
                isPass: true,
                textEditingController: _passwordEditingController,
                textInputType: TextInputType.text,
                prefixIcon: const Icon(Icons.lock)),

            SizedBox(height: heightScreen * 0.02),

            TextInputfield(
                hintText: "  Enter Your Bio",
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                prefixIcon: const Icon(Icons.ac_unit_sharp)),

            SizedBox(height: heightScreen * 0.04),

            // SignUp buttton
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                // Apply a gradient using BoxDecoration
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 19, 129, 141),
                      ourColor,
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
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            SizedBox(height: heightScreen * 0.08),

            // Flexible(
            //   flex: 2,
            //   child: Container(),
            // ),

            //Transition to sign up screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Already have an account? "),
                ),
                // Wrap GestureDetector with MouseRegion
                MouseRegion(
                  onEnter: (_) => setState(() => isHovered = true), // On hover
                  onExit: (_) =>
                      setState(() => isHovered = false), // On hover exit
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NgoLoginScreen()))
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Log in.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isHovered
                              ? ourColor
                              : const Color.fromARGB(
                                  255, 255, 255, 255), // Change color on hover
                          fontSize: isHovered ? 12 : 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: heightScreen * 0.02),
          ],
        ),
      ),
    ));
  }
}
