
import 'package:flutter/material.dart';
import 'package:firebase_test/test_login.dart';


// 測試firebase server function
class no_use_LoginPage extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();

  no_use_LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN")),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              final ok = await _authRepository.signInWithGoogle();
              if (ok) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
            child: Text("SIGN IN"),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              await _authRepository.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => no_use_LoginPage(),
                ),
              );
            },
            child: Text("SIGN OUT"),
          ),
        ),
      ),
    );
  }
}