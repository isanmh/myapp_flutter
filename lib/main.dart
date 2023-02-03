import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/onboarding_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/splash_page.dart';

void main() {
  // ini unutk intro
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

// stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        // "/": (context) => SplashPage(),
        // "/": (context) => OnboardingPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
