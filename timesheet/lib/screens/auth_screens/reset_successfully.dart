import 'package:flutter/material.dart';
import 'package:timesheet/screens/auth_screens/reset_password_screen.dart';
import 'package:timesheet/screens/home_screen.dart';
import 'package:timesheet/utils/colors.dart';

class ResetSuccessfully extends StatefulWidget {
  const ResetSuccessfully({super.key});

  @override
  State<ResetSuccessfully> createState() => _ResetSuccessfullyState();
}

class _ResetSuccessfullyState extends State<ResetSuccessfully> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             

              // App Title
              const Text(
                "Timesheet",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Welcome Text
              const Text(
                "Your password has been reset successfully.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),

                // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            
            
            ]
              ),
             
            
          ),
        ),
      );
  }
}
