import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SSOPage extends StatefulWidget {
  const SSOPage({super.key});

  @override
  State<SSOPage> createState() => _SSOPageState();
}

class _SSOPageState extends State<SSOPage> {
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
              initialUrl:
                  "https://sso.jabarprov.go.id/realms/ssojabar/protocol/openid-connect/auth?response_type=code&scope=email&client_id=portal-dev&redirect_uri=https%3A%2F%2Fdev-adpem.jabarprov.go.id%2Fauth",
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
