import 'package:flutter/material.dart';
import 'package:foodiesbites/features/sign_in/sign_in.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'GET ON BOARD!',
          style: TextStyle(
            color: Color(0xFF034904),
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            'Create your own profile to start your journey',
            style: TextStyle(
              color: Color(0xFF034904),
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFDFE0E2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height / 20),
                const SignUpHeader(),
                SizedBox(height: size.height / 30),
                // Form fields
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Full Name',
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    focusedBorder: borderStyle,
                    border: borderStyle,
                    enabledBorder: borderStyle,
                  ),
                ),
                SizedBox(height: size.height / 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    hintText: 'Email',
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    focusedBorder: borderStyle,
                    border: borderStyle,
                    enabledBorder: borderStyle,
                  ),
                ),
                SizedBox(height: size.height / 30),
                TextField(
                  controller: phNoController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_android),
                    hintText: 'Phone Number',
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    focusedBorder: borderStyle,
                    border: borderStyle,
                    enabledBorder: borderStyle,
                  ),
                ),
                SizedBox(height: size.height / 40),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: const Icon(Icons.visibility_off),
                    hintText: 'Password',
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    focusedBorder: borderStyle,
                    border: borderStyle,
                    enabledBorder: borderStyle,
                  ),
                ),
                SizedBox(height: size.height / 20),
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
                            MaterialPageRoute(builder: (context) => const SignInScreen()),
                          );
                    },
                    child: GestureDetector(
                      onTap: () {
                          
                        },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
              
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height / 25),
                const Center(
                  child: Text('OR', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),),
                ),
                SizedBox(height: size.height / 40),
                const Center(
                  child: Text('Sign Up With', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 33, 18, 247),),),
                ),
                SizedBox(height: size.height / 35),
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
                ),
                SizedBox(height: size.height / 35),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center, // Aligns vertically
                    children: [
                      const Text(
                        'I have an account',
                        style: TextStyle(
                          color: Color(0xFF034904),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10), // Space between "I have an account" and "Log In"
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()), // SignInScreen is still constant
                          );
                        },
                        child: const Text(
                          'Log In',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
