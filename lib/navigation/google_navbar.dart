import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/pages/home_page.dart';

class GoogleNavbar extends StatefulWidget {
  const GoogleNavbar({super.key});

  @override
  State<GoogleNavbar> createState() => _GoogleNavbarState();
}

class _GoogleNavbarState extends State<GoogleNavbar> {
  int currentPage = 0;

  // widget untuk halaman
  List<Widget> pages = [
    HomePage(),
    Text("Page 2"),
    Text("Page 3"),
    Text("Page 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
            tabShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 12,
                spreadRadius: -15,
                offset: Offset(0, 0),
              ),
            ],
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            padding: EdgeInsets.all(16),
            tabBackgroundGradient: LinearGradient(colors: [
              // Color(0xffD661E0),
              Color(0xff22c1c3),
              Colors.deepPurple,
              // Color(0xfffdbb2d),
            ]),
            tabBorderRadius: 30,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.video_call, text: "Youtube"),
              GButton(icon: Icons.settings, text: "Services"),
              GButton(icon: Icons.favorite, text: "Amazon"),
            ],
          ),
        ),
      ),
      body: pages[currentPage],
    );
  }
}
