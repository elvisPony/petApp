import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/navigation_controls.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key,
  required this.account, required this.password
  });
  final String account;
  final String password;

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
        Uri.parse('https://pets.ettoday.net'),
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
                  petIndex(
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