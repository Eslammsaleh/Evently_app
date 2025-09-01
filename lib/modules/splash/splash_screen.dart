import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/HomeView.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/modules/onbording/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/'; // route name

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بعد ثانيتين يروح للصفحة الصح
    Future.delayed(const Duration(seconds: 2), _checkAuth);
  }

  void _checkAuth() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ✅ فيه يوزر مسجل دخول بالفعل
      Navigator.pushReplacementNamed(context, HomeView.route);
    } else {
      // 🔹 مفيش يوزر مسجل دخول
      Navigator.pushReplacementNamed(context, OnboardingScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset("assets/logo/AppLogo.png"),
            ),
            Image.asset("assets/logo/SplashBotoomLogo.png"),
          ],
        ),
      ),
    );
  }
}
