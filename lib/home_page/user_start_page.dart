//進入畫面

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import 'package:firebase_test/main.dart';
import 'package:firebase_test/palatte.dart';
import 'package:firebase_test/widgets/text-input.dart';
import 'package:firebase_test/widgets/password-input.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/home_page/creatAccount.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';

import 'package:firebase_test/empty_page.dart';






class user_start_page extends StatelessWidget {
  final String account;
  final String password;

  const user_start_page({
    super.key,
    required this.account,
    required this.password
  });

  @override
  Widget build(BuildContext context) {
    print(account);
    print(password);
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
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [

                        Column(
                          children: [
                            SizedBox(
                              height: 20,

                            ),
                            Container(
                              width:  MediaQuery.of(context).size.width ,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Colors.grey.shade600.withOpacity(0.5)
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
                                          builder: (context) => petIndex(
                                            account: account,
                                            password: password,
                                          )
                                      )
                                  );
                                },
                                child: const Text('歡迎回來主人'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue,//Colors.grey.shade600.withOpacity(0.5)
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
                                          builder: (context) => petIndex(
                                            account: account,
                                            password: password,
                                          )
                                      )
                                  );
                                },
                                child: const Text('點擊此處進入應用程式'),
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
}

