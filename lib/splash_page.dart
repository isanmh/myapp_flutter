import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // constructor
  @override
  void initState() {
    // delay
    Timer(
      const Duration(seconds: 3),
      // (kodisi== true ? true : false) -> if else ternary
      () => introduction == 0
          ? Navigator.pushReplacementNamed(context, '/onboarding')
          : Navigator.pushReplacementNamed(context, '/navbar'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/youtube.png",
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
