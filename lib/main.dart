import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodiesbites/features/sign_in/sign_in.dart';
import 'package:foodiesbites/generated/app_theme/app_theme.dart';
import 'package:foodiesbites/features/onboarding_Screen/onboarding_screen.dart';
import 'package:foodiesbites/features/bottom_nav/bottom_bar.dart';
// ignore: unused_import
import 'package:foodiesbites/generated/food_order/food_order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies Bites',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const HomeScreen(),
     /* routes: {
        '/chat': (context) => const ChatPage(),
        '/call': (context) => const CallPage(),
        '/notification_detail': (context) => const NotificationDetailPage(),
        '/cart': (context) => const CartPage(),
        '/people': (context) => const People(),
      },*/
    );
  }
}

// AuthWrapper to check login status or show onboarding
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});


  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool? isLoggedIn;
  bool? isFirstLaunch;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if the user is logged in or if it's their first launch
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool? firstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    setState(() {
      isLoggedIn = loggedIn;
      isFirstLaunch = firstLaunch;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_interpolation_to_compose_strings
    log("Logged Checker "+isLoggedIn.toString());
    if (isLoggedIn == null || isFirstLaunch == null) {
      // Show loading indicator while checking SharedPreferences
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (isFirstLaunch == true) {
      // Show onboarding screen if it's the first launch
      return const OnboardingScreen();
    } else if (isLoggedIn == true) {
          // ignore: prefer_interpolation_to_compose_strings
          log("Logged Checker? "+isLoggedIn.toString());

      // Show main UI if user is logged in
      return const BottomNavBarAll();
    } else {
      // Show home screen (which redirects to sign-in after a splash delay)
      return const SignInScreen();
    }
  }
}

// Splash Screen/HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appIcon = 'assets/images/foodie logo.png';
  late Widget myIcon;

  @override
  void initState() {
    super.initState();
    myIcon = Image.asset(
      appIcon,
      width: 130,
      height: 130,
    );
    Future.delayed(const Duration(seconds: 5)).then((_) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthWrapper(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFDFE0E2),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              myIcon,
              SizedBox(
                width: size.width,
                height: size.height / 20,
              ),
              const Text(
                'Get quality Food Services',
                style: TextStyle(
                  color: Color(0xFF034904),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


