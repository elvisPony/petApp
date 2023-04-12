// 目錄

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/user_app/news_web.dart';

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
                        builder: (context) => petIndex(
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
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [

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
                                      builder: (context) =>  WebViewApp(
                                        account: account,
                                        password: password,
                                        url:"https://pets.ettoday.net",
                                      )));
                            },
                            child: const Text('ETtoday寵物雲'),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
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
                                      builder: (context) =>  WebViewApp(
                                        account: account,
                                        password: password,
                                        url:"https://udn.com/search/tagging/2/%E5%AF%B5%E7%89%A9",
                                      )));
                            },
                            child: const Text('聯合新聞網 寵物專欄'),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
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
                                      builder: (context) =>  WebViewApp(
                                        account: account,
                                        password: password,
                                        url:"https://www.setn.com/Catalog.aspx?PageGroupID=47",
                                      )));
                            },
                            child: const Text('三立新聞網 寵物專欄'),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),



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
                                      builder: (context) =>  WebViewApp(
                                        account: account,
                                        password: password,
                                        url:"https://tw.news.yahoo.com/topic/pets",
                                      )));
                            },
                            child: const Text('yahoo新聞 毛宇宙'),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

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
                                      builder: (context) =>  WebViewApp(
                                        account: account,
                                        password: password,
                                        url:"https://www.chinatimes.com/search/%E5%AF%B5%E7%89%A9?chdtv",
                                      )));
                            },
                            child: const Text('中時新聞網 寵物專欄'),
                          ),
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
