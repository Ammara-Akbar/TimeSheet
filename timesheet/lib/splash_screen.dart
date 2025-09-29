// lib/auth_screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timesheet/screens/home_screen.dart';
import 'package:timesheet/screens/auth_screens/login_screen.dart';
import 'package:timesheet/utils/my_images.dart';
import 'utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   MyImages.appLogo,
            //   height: 120,
            //   width: 160,
            // ),
            // const SizedBox(height: 7),
             Text(
              'Timesheet',
              style: TextStyle(
                fontSize: 40,
                letterSpacing: 2.6,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
