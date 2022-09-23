// 貓的自我檢測

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/user_app/pet_self_dect.dart';

const primaryColor = Color(0xFFedc96c);

class cat_health_dection extends StatelessWidget {
  final String account;
  final String password;

  cat_health_dection({
    super.key,
    required this.account,
    required this.password,
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
              "貓的自我檢測",
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
                        builder: (context) => pet_self_dect(
                              account: account,
                              password: password,
                            )));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    //過瘦
                    Container(
                      //padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue.shade200,
                        ),
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              color: Colors.blue.shade200,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "過瘦",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "可看出短毛貓的肋骨，觸摸不到脂肪，腹部嚴重內縮，可輕易觸摸到腰椎與腸骨翼",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "可以輕易看出短毛貓的肋骨，腰椎明顯附有少量肌肉，腹部明顯內縮，觸摸不到脂肪",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨可輕易觸摸到，且有極少量脂肪包覆，腰椎明顯，明顯看出腰部在肋骨後方，腰部脂肪極少",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨可觸摸到，且有極少量脂肪包覆，明顯看出腰部在肋骨後方腹部輕微內縮，未見腹部脂肪墊",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),


                          Container(
                            color:  Colors.white.withOpacity(0.8),
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    //理想體態
                    Container(
                      //padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue.shade200,
                        ),
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              color: Colors.blue.shade200,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "理想體態",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "身體比例均衡，明顯看出腰部在肋骨後方，肋骨可觸摸到，且有少須脂肪包覆，腰部有極少脂肪墊",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),

                          Container(
                            color:  Colors.white.withOpacity(0.8),
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //過胖
                    Container(
                      //padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue.shade200,
                        ),
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              color: Colors.blue.shade200,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "過胖",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨可觸摸到，包覆肋骨的脂肪些微過多，可看出腰部與腹部的脂肪墊，但不明顯，腹部明顯內縮",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨不易觸摸到，覆有中量脂肪，腰部難以辨識，腹部明顯呈圓形，腹部有中量脂肪墊",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨觸摸不到，包覆肋骨的脂肪過多，看不出腰部，腹部明顯呈圓型，且腹部脂肪墊明顯，腰椎有脂肪堆積",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              indent: 5,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white.withOpacity(0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "肋骨觸摸不到，有大量脂肪包覆，腰椎、臉部與四肢堆積大量脂肪，腹部膨脹，分辨不出腰部，腹部堆積大量脂肪",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),


                          Container(
                            color:  Colors.white.withOpacity(0.8),
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
