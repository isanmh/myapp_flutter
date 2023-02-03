import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/navigation/google_navbar.dart';
import 'package:myapp/onboarding_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// buat menyimpan data global onboarding page + SharedPreferences
int introduction = 0;

void main() async {
  // pemanggilan widget SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  // ini untuk intro
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  await initIntro();
  runApp(const MyApp());
}

// fungsi shared preferences
Future initIntro() async {
  final prefs = await SharedPreferences.getInstance();
  // cek apakah sudah pernah diinstall
  int? intro = prefs.getInt('introduction');
  print("sudah pernah diinstall: $intro");
  if (intro != null && intro == 1) {
    return introduction = intro;
  }
  prefs.setInt('introduction', 1);
}

// stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        "/": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        "/onboarding": (context) => const OnboardingPage(),
        "/navbar": (context) => const GoogleNavbar(),
      },
      // home: OnboardingPage(),
    );
  }
}
