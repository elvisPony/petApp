import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/navigation_controls.dart';

import 'package:firebase_test/user_app/news_page.dart';

class WebViewApp extends StatefulWidget {
  final String account;
  final String password;
  final String url;
  const WebViewApp({super.key,
  required this.account, required this.password,
    required this.url
  });

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.house),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    news_page(
                    account: widget.account,
                    password: widget.password,
                )));
          },
        ),
        title: const Text(''),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}