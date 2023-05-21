//進入畫面

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_test/main.dart';
import 'package:firebase_test/palatte.dart';
import 'package:firebase_test/widgets/text-input.dart';
import 'package:firebase_test/widgets/password-input.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/home_page/creatAccount.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/noti.dart';
import 'package:firebase_test/empty_page.dart';
import 'dart:async';


final LocalNotificationService service =  LocalNotificationService();




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
    service.intialize();
    checkRemind();
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

  void checkRemind() async{

    var users =
    FirebaseFirestore.instance.collection('UserInformation').doc(
        account);
    var docSnapshot = await users.get();
    Map<String, dynamic>? user_data = docSnapshot.data();
    if (user_data!.keys.toList().contains("pet_note_array") == true) {
      for (int i = user_data["pet_note_array"].length -1 ;i>= 0; i--) {
        var nowTime = DateTime.now();
        nowTime = DateTime.utc(
            nowTime.year,
            nowTime.month,
            nowTime.day,
            nowTime.hour,
            nowTime.minute,
            nowTime.second
        );
        var settingTime = DateTime.utc(
            int.parse(user_data["pet_note_array"][i]["setYear"])+1911,
            int.parse(user_data["pet_note_array"][i]["setMonth"] ),
            int.parse(user_data["pet_note_array"][i]["setDay"] ),
            int.parse(user_data["pet_note_array"][i]["setHour"] ),
            int.parse(user_data["pet_note_array"][i]["setMinute"]),
            0);// 0 是設定秒數
        await service.showScheduleNotification(
            id: 0,
            title: user_data["pet_note_array"][i]["petName"],
            body: user_data["pet_note_array"][i]["doingThing"],
            days: 0,
            hours: 0,
            minutes: settingTime.difference(nowTime).inMinutes,
            seconds: settingTime.difference(nowTime).inSeconds - (60 * settingTime.difference(nowTime).inMinutes)
          );
        print(settingTime.difference(nowTime).inMinutes);
        print(settingTime.difference(nowTime).inSeconds);
        print("check succse");
        Timer(Duration(minutes: settingTime.difference(nowTime).inMinutes,seconds: settingTime.difference(nowTime).inSeconds  - (60 * settingTime.difference(nowTime).inMinutes)),
                () {deleteNote(user_data["pet_note_array"][i]["setYear"],
                    user_data["pet_note_array"][i]["setMonth"],
                    user_data["pet_note_array"][i]["setDay"],
                    user_data["pet_note_array"][i]["setHour"],
                user_data["pet_note_array"][i]["setMinute"]);}
        );
        }
      }

  }

  void deleteNote(String year, String month, String day, String hour,String minute) async{
    print('try to delete');
    try {
      var users =
      FirebaseFirestore.instance.collection('UserInformation').doc(
          account);
      var docSnapshot = await users.get();
      Map<String, dynamic>? user_data = docSnapshot.data();
      if (user_data!.keys.toList().contains("pet_note_array") == true) {
        for (int i = user_data["pet_note_array"].length -1 ;i>= 0; i--) {
          if (user_data["pet_note_array"][i]["setYear"] == year &&
              user_data["pet_note_array"][i]["setMonth"] == month &&
              user_data["pet_note_array"][i]["setDay"] == day &&
              user_data["pet_note_array"][i]["setHour"] == hour &&
              user_data["pet_note_array"][i]["setMinute"] == minute ) {
            user_data["pet_note_array"].removeAt(i);
            //print(i.toString()+ ' index');
          }
        }
        users.update({"pet_note_array": user_data["pet_note_array"]});
      }
    }on FirebaseAuthException catch (e) {
      //EasyLoading.dismiss();

    } catch (e) {
      //EasyLoading.dismiss();
      print(e);
    }

  }
}

