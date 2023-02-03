import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // untuk controller webview
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: "https://servicedesk.jabarprov.go.id/",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onPageStarted: (url) {
                print("Page started loading: $url");
                Future.delayed(
                  const Duration(seconds: 3),
                  () => setState(() {
                    isLoading = false;
                  }),
                );
              },
              onPageFinished: (url) {
                print("Page finished loading: $url");
                setState(() {
                  isLoading = false;
                });
              },
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
