import 'package:flutter/material.dart';
import 'package:foodiesbites/features/sign_in/sign_in.dart';
import 'dart:ui'; // Import this for ImageFilter.blur
import 'package:shared_preferences/shared_preferences.dart';
// Import your main app file

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: const [
                OnboardingPage(
                  image: 'assets/images/food2.jpg',
                  text: 'Welcome to Bites',
                ),
                OnboardingPage(
                  image: 'assets/images/food2.jpg',
                  text: 'Discover new recipes and restaurants!',
                ),
                OnboardingPage(
                  image: 'assets/images/food2.jpg',
                  text: 'Let’s get started!',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isFirstLaunch', false);
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              }
            },
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Onboarding Page Widget with blurred background
class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;

  const OnboardingPage({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Ensures the image covers the entire background
      children: [
        // Full background image
        Image.asset(
          image,
          fit: BoxFit.cover, // Ensures the image covers the entire screen
        ),
        // Blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
          child: Container(
            color: Colors.black.withOpacity(0.3), // Optional: Add a slight overlay to improve contrast
          ),
        ),
        // Text in the center
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white, // Ensure text is visible against the blurred background
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Align text at the center
              ),
            ],
          ),
        ),
      ],
    );
  }
}
