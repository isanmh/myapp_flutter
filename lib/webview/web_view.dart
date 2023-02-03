import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // untuk controller webview
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube'),
        actions: [
          IconButton(
            onPressed: () {
              controller.goBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              controller.goForward();
            },
            icon: Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              controller.reload();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: "https://www.youtube.com/",
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
                // controller.runJavascript(
                //     "document.body.style.backgroundColor = 'red';");
              },
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_upward),
        onPressed: () async {
          final currentUrl = await controller.currentUrl();
          print('currentUrl yg aktif: $currentUrl');
          controller.loadUrl('https://www.amazon.com/');
        },
      ),
    );
  }
}
