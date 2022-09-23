// 狗的自我檢測

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/user_app/pet_self_dect.dart';

const primaryColor = Color(0xFFedc96c);

class dog_health_dection extends StatelessWidget {
  final String account;
  final String password;

  dog_health_dection({
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
              "狗的自我檢測",
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
                                "遠處即可看見肋骨、腰椎、骨盆及所有骨頭隆起處，看不出任何體脂肪，肌肉明顯喪失",
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
                                "可輕易看出肋骨、腰椎及骨盆，觸摸不到脂肪，有一些其他骨頭隆起處的痕跡，肌肉極少喪失",
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
                                "可輕易觸摸到肋骨，看得出脂肪但觸摸不到，腰椎頂端可輕易看見，骨盆明顯，腰部與腹部明顯內縮",
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
                                "肋骨可輕易觸摸到，且有極少量脂肪包覆，從上方看可輕易看出腰部，腹部明顯內縮",
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
                                "肋骨可輕易觸摸到，且沒有過多脂肪包覆，從上方看可看出腰部在肋骨後方，從側面可看見腹部上提",
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
                                "肋骨可觸摸到，包覆肋骨的脂肪些微過多，從上方可看出腰部，但不明顯，腹部明顯內縮",
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
                                "肋骨難以摸出，且有過多脂肪包覆，腰椎與尾巴底端可見脂肪堆積，幾乎看不出腰部，腰部可能有內縮",
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
                                "肋骨有非常多的脂肪，觸摸不到，或用力觸摸才摸的到，腰椎與尾巴底堆堆積大量脂肪，看不出腰部，腹部未內縮，腹部可能明顯膨脹",
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
                                "胸部、脊椎與尾巴底端堆積非常大量的脂肪，腰部與腹部未內縮，脂肪堆積在頭部四肢、腹部明顯膨脹",
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
