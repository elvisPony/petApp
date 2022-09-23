// 目錄

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/user_app/add_pet_note_page.dart';

const primaryColor = Color(0xFFedc96c);

class my_pet_note extends StatefulWidget {

  final String account ;
  final String password ;

  const my_pet_note({
    super.key,
    required this.account,
    required this.password,
});



  @override
  State<my_pet_note> createState() => _my_pet_note(
      account: account,
      password: password,
  );
}





class _my_pet_note extends State<my_pet_note> {

  final String account ;
  final String password ;

  _my_pet_note({

  required this.account,
  required this.password,
  });

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

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
              "我的寵物記事本",
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
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  add_pet_note_page(
                            account: account,
                            password: password,
                          )));
                },
              ),
            ],
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

                            SizedBox(
                              height: 10,
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
