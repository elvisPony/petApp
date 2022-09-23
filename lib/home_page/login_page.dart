// 登入介面

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_test/widgets/text-input.dart';
import 'package:firebase_test/widgets/password-input.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/home_page/creatAccount.dart';
import 'package:firebase_test/home_page/user_start_page.dart';







// -----------------------------------------

class LoginPage extends StatelessWidget {

  UserCredential? userCredential;
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  void initState() {
    accountController.text = "";
    passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    initState();

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 100,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(                      // 帳號 密碼 文字框
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInputs(
                              hint: '帳號',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              controllers: accountController,
                            ),
                            PasswordInput(
                              hint: '密碼',
                              inputAction: TextInputAction.done,
                              controllers: passwordController,
                            ),
                          ],
                        ),
                        Column(                           // 登入按鈕
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () async {

                                  if (await _loginButton(accountController.text , passwordController.text) ) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => user_start_page(
                                                account :  accountController.text,
                                                password : passwordController.text
                                            )
                                        )
                                    );
                                  }
                                },
                                child: const Text('登入'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => creatAccountPage()
                                      )
                                  );
                                },
                                child: const Text('建立新帳號'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> _loginButton(String text1, String text2) async {
    //print(text1);
    //print(text2);
    //print("button");


      CollectionReference users =
      FirebaseFirestore.instance.collection('UserInformation');
      DocumentSnapshot account_data = await users.doc(text1).get();


      if (account_data.data() == null) {
        Fluttertoast.showToast(
          backgroundColor: Colors.grey,
          msg: 'No user found for that email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );

        print('No user found for that email.');
        return false;
      }
      DocumentSnapshot password_data =
      await FirebaseFirestore.instance.collection('UserInformation').doc(text1).get();

      print(text2);
      Map<String, dynamic> password = password_data.data() as Map<String, dynamic> ;
      print(  password['password']  );
      if (password['password'] != text2) {
        Fluttertoast.showToast(
          backgroundColor: Colors.grey,
          msg: "Wrong password provided for that user.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );

        print('Wrong password provided for that user.');
        return false;
      }

    print('success');
    return true;

  }
}

