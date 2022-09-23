// 寵物健康自我檢測

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/cat_health_dection.dart';
import 'package:firebase_test/widgets/dog_health_dection.dart';

const primaryColor = Color(0xFFedc96c);

class pet_self_dect extends StatelessWidget {
  final String account;
  final String password;

  pet_self_dect({
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
              "寵物健康自我檢測",
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            //貓的自我檢測
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cat_health_dection(
                                            account: account,
                                            password: password,
                                          )));
                                },
                                child: Container(
                                  color: Colors.blue.shade300,
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          //color: Colors.white,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              1 /
                                              4,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              2 /
                                              23,
                                          // pet image
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.pinkAccent.shade100,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_cat1.png'),
                                              fit: BoxFit.scaleDown,
                                            ),
                                            border:
                                            Border.all(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "貓的自我檢測",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            //狗的自我檢測
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => dog_health_dection(
                                                account: account,
                                                password: password,
                                              )));
                                },
                                child: Container(
                                  color: Colors.blue.shade300,
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          //color: Colors.white,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1 /
                                              4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              2 /
                                              23,
                                          // pet image
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.yellowAccent.shade100,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_group7.png'),
                                              fit: BoxFit.scaleDown,
                                            ),
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "狗的自我檢測",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
