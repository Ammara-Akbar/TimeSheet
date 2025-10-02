import 'package:flutter/material.dart';
import 'package:timesheet/screens/web/web_login_screen.dart';

import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:
    // WebLoginScreen(),
       SplashScreen()
    );
  }
}
