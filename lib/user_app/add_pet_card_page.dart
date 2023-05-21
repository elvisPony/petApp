// 寵物資料卡新增

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_test/user_app/pet_cards.dart';
import 'package:firebase_test/widgets/pet_card.dart';

const primaryColor = Color(0xFFedc96c);

class add_pet_card_page extends StatelessWidget {
  final String account;
  final String password;

  final TextEditingController petName = TextEditingController();
  final TextEditingController petRace = TextEditingController();
  final TextEditingController petSex = TextEditingController();

  TextEditingController petBirthday = TextEditingController();
  TextEditingController petLength = TextEditingController();
  TextEditingController petWeight = TextEditingController();
  TextEditingController remark =  TextEditingController();



  add_pet_card_page({super.key,
  required this.account,
  required this.password,
  });

  void initState() {
    petName.text = "";
    petRace.text = "";
    petSex.text = "";
    petBirthday.text = "";
    petLength.text = "";
    petWeight.text = "";
    remark.text = "";

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
              "寵物資料卡新增",
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
                        builder: (context) => my_pet_cards(
                          account: account,
                          password: password,
                        )));
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (petName.text == "")
                  {
                    Fluttertoast.showToast(
                      backgroundColor: Colors.grey,
                      msg: "名字不為空",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                    return;
                  }
                  add_pet_card();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => my_pet_cards(
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
                            pet_card(
                              petName: petName,
                              petRace: petRace,
                              petSex: petSex,
                              petBirthday: petBirthday,
                              petLength: petLength,
                              petWeight: petWeight,
                              remark: remark,
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



  Future<void> add_pet_card()async{

    final data = <String, String>{
      "petName" : petName.text,
      "petRace" : petRace.text,
      "petSex" : petSex.text,
      "petBirthday" : petBirthday.text,
      "petLength" : petLength.text,
      "petWeight" : petWeight.text,
      "remark" : remark.text,
    };
    var users =
    FirebaseFirestore.instance.collection('UserInformation').doc(account);
    var docSnapshot = await users.get();
    Map<String, dynamic>? user_data = docSnapshot.data();

    if ( user_data!.keys.toList().contains("pet_card_array") == false)
      {
        users.update({"pet_card_array" : [data] });
      }
    else {
      user_data["pet_card_array"].add(data);
      users.update({"pet_card_array" :user_data["pet_card_array"] });
    }


  }
}
