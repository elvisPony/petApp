// 目錄

import 'package:firebase_test/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/news_page.dart';
import 'package:firebase_test/user_app/my_pet_note.dart';
import 'package:firebase_test/user_app/pet_cards.dart';
import 'package:firebase_test/user_app/pet_self_dect.dart';
import 'package:firebase_test/user_app/modify_account.dart';
import 'package:firebase_test/home_page/login_page.dart';



const primaryColor = Color(0xFFedc96c);

class petIndex extends StatelessWidget {

  final String account ;
  final String password ;

  const petIndex({
  super.key,
  required this.account,
  required this.password
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text(
              "目錄",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          children: [

                            //最新新聞
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  news_page(
                                            account: account,
                                            password: password,
                                          )));
                                },
                                child: const Text('最新新聞'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // 我的寵物記事本
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  my_pet_note(
                                            account: account,
                                            password: password,
                                          )));
                                },
                                child: const Text('我的寵物記事本'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            //寵物資料卡一覽
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  my_pet_cards(
                                            account: account,
                                            password: password,
                                          )));
                                },
                                child: const Text('寵物資料卡一覽'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // 寵物自我健康檢測
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  pet_self_dect(
                                            account: account,
                                            password: password,
                                          )));
                                },
                                child: const Text('寵物自我健康檢測'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // 帳戶資料更改
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  ModifyAccount(
                                            account: account,
                                             password: password,
                                          )));
                                },
                                child: const Text('帳戶資料更改'),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            // 帳戶資料更改
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () =>showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('確認是否登出'),
                                    content: const Text(''),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, '取消'),
                                        child: const Text('取消'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) =>  LoginPage(
                                        )));
                                          },
                                        child: const Text('登出'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Text('登出'),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
