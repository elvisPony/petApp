// 新增提醒事項

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/news_wall.dart';
import 'package:firebase_test/widgets/pet_remind_note.dart';


const primaryColor = Color(0xFFedc96c);

class add_pet_note_page extends StatelessWidget {
  final String account;

  final String password;

  final TextEditingController petName = TextEditingController();
  final TextEditingController doingThing = TextEditingController();
  final TextEditingController remark = TextEditingController();

   TextEditingController setYear = TextEditingController();
   TextEditingController setMonth = TextEditingController();
   TextEditingController setDay = TextEditingController();
   TextEditingController setHour =  TextEditingController();
   TextEditingController setMinute =  TextEditingController();


  add_pet_note_page({super.key,
  required this.account,
  required this.password,
  });

  void initState() {
    petName.text = "";
    doingThing.text = "";
    remark.text = "";
    setYear.text = "";
    setMonth.text = "";
    setDay.text = "";
    setHour.text = "";
    setMinute.text = "";
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initState();
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text(
              "新增提醒事項",
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
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
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
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //width:MediaQuery.of(context).size.width * 3 / 4,
                    //height: MediaQuery.of(context).size.height * 3 / 4,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            pet_remind_note(
                              petNameControllers: petName,
                              doingThingsControllers: doingThing,
                              remark: remark,
                              setYear: setYear,
                              setMonth: setMonth,
                              setDay: setDay,
                              setHour: setHour,
                              setMinute: setMinute,
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
