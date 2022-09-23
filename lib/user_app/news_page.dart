// 目錄

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/news_wall.dart';

const primaryColor = Color(0xFFedc96c);

class news_page extends StatelessWidget {

  final String account ;
  final String password ;

  const news_page({
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
              "最新新聞",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  petIndex(
                          account: account,
                          password: password,
                        )));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          children: [

                            news_wall(
                              account: account,
                              password: password,
                              headText: "號誌桿「被狗狗尿斷」！警測出42倍尿素傻眼",
                              bodyText: "這算是「滴水穿石」嗎？許多狗狗為了要佔地盤，都會專門跑到電線桿底下尿尿，日本先前傳出有一根號誌桿使用年限才不到一半，卻莫名其妙從根部斷裂，",
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            news_wall(
                              account: account,
                              password: password,
                              headText: "號誌桿「被狗狗尿斷」！警測出42倍尿素傻眼",
                              bodyText: "這算是「滴水穿石」嗎？許多狗狗為了要佔地盤，都會專門跑到電線桿底下尿尿，日本先前傳出有一根號誌桿使用年限才不到一半，卻莫名其妙從根部斷裂，",
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
