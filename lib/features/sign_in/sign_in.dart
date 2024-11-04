import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiesbites/features/bottom_nav/bottom_bar.dart';
import 'package:foodiesbites/features/sign_up/sign_up.dart';


class FirstSvgWidget extends StatelessWidget {
  const FirstSvgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/facebook logo.svg',  // Path to your first SVG
        height: 40.0,  // Set the height (optional)
        width: 40.0,   // Set the width (optional)
      ),
    );
  }
}

class SecondSvgWidget extends StatelessWidget {
  const SecondSvgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/google logo.svg',  // Path to your first SVG
        height: 40.0,  // Set the height (optional)
        width: 40.0,   // Set the width (optional)
      ),
    );
  }
}

class ThirdSvgWidget extends StatelessWidget {
  const ThirdSvgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/apple logo.svg',  // Path to your first SVG
        height: 40.0,  // Set the height (optional)
        width: 40.0,   // Set the width (optional)
      ),
    );
  }
}
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool tapped = false;    // For toggling password visibility
  bool tappedSnd = false; // For the 'Remember me' checkbox

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 6,
                ),
                const Text(
                  'WELCOME TO FOODIES BITES',
                  style: TextStyle(
                      color: Color(0xFF034904),
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 18,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email or Username',
                      style: TextStyle(
                          color: Color(0xFF034904),
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: size.width,
                  height: size.height / 72,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFDFE0E2),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 80,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Color(0xFF034904),
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: size.width,
                  height: size.height / 72,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: !tapped, // Control visibility based on tapped
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          tapped = !tapped; // Toggle password visibility
                        });
                      },
                      child: tapped
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    fillColor: const Color(0xFFDFE0E2),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 30,
                ),
                Row(
                  children: [
                    const Text(
                      'Remember me',
                      style: TextStyle(
                          color: Color(0xFF034904),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tappedSnd = !tappedSnd; // Toggle the 'Remember me' state
                        });
                      },
                      child: Icon(
                        tappedSnd ? Icons.check_box : Icons.check_box_outline_blank, // Use correct icons
                        size: 30.0,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Color(0xFF034904),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 20,
                ),
                SizedBox(
                  width: size.width,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF034904),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {

                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BottomNavBarAll()),
                          );
                    },
                    child: 
                    const Text(
                        'LOG IN',  
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700),
                      ),
                  ),
                ),
                emailController.text == ''
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          Text(emailController.text),
                          Text(passwordController.text),
                        ],
                      ),
                SizedBox(
                  width: size.width,
                  height: size.height / 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center, // Aligns vertically
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color(0xFF034904),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10), // Space between "Don't have an account?" and "Sign Up"
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 33, 18, 247),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 30,
                ),
                const Text(
                        'Sign up with',
                        style: TextStyle(
                          color: Color(0xFF034904),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                SizedBox(
                  width: size.width,
                  height: size.height / 35,
                ),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FirstSvgWidget(),  // First SVG widget
                      SizedBox(width: 30),  // Horizontal space between the widgets
                      SecondSvgWidget(),  // Second SVG widget
                      SizedBox(width: 30),  // Horizontal space between the widgets
                      ThirdSvgWidget(),  // Third SVG widget
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
