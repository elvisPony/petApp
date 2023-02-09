// 新增提醒事項
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/user_app/add_pet_card_page.dart';
import 'package:firebase_test/user_app/my_pet_note.dart';

import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/news_wall.dart';
import 'package:firebase_test/widgets/pet_remind_note.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_test/widgets/noti.dart';
import 'package:firebase_test/widgets/second_screen.dart';
class RemindBool{
  bool remind;
  RemindBool(this.remind);

}

const primaryColor = Color(0xFFedc96c);


class add_pet_note_page extends StatefulWidget{
  final String account;
  final String password;

  const add_pet_note_page({
  super.key,
  required this.account,
  required this.password,
});
  @override
  State<add_pet_note_page> createState() => _add_pet_note_page();
}


class _add_pet_note_page extends State<add_pet_note_page> {

  late final LocalNotificationService service;

  final TextEditingController petName = TextEditingController();
  final TextEditingController doingThing = TextEditingController();
  final TextEditingController remark = TextEditingController();

   TextEditingController setYear = TextEditingController();
   TextEditingController setMonth = TextEditingController();
   TextEditingController setDay = TextEditingController();
   TextEditingController setHour =  TextEditingController();
   TextEditingController setMinute =  TextEditingController();
   RemindBool remind = RemindBool(false);


  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    petName.text = "";
    doingThing.text = "";
    remark.text = "";
    setYear.text = "";
    setMonth.text = "";
    setDay.text = "";
    setHour.text = "";
    setMinute.text = "";
    super.initState();
  }


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
              onPressed: ()  {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => my_pet_note(
                              account: widget.account,
                              password: widget.password,
                            )));
              },
            ),
            actions: [
              // 儲存note
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () async {

                  if (nameIsEmpty()){
                    Fluttertoast.showToast(
                      backgroundColor: Colors.grey,
                      msg: "名字不為空白",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );
                    return;
                  }


                  await btnEvent();
                  // 鬧鐘設定時間
                  if(remind.remind){
                    var nowTime = DateTime.now();
                    nowTime = DateTime.utc(
                        nowTime.year,
                        nowTime.month,
                        nowTime.day,
                        nowTime.hour,
                        nowTime.minute
                    );
                    var settingTime = DateTime.utc(
                        int.parse(setYear.text)+1911,
                        int.parse(setMonth.text),
                        int.parse(setDay.text),
                        int.parse(setHour.text),
                        int.parse(setMinute.text),
                        0);

                    await service.showScheduleNotification(
                      id: 0,
                      title: petName.text,
                      body: doingThing.text,
                      days: 0,
                      hours: 0,
                      minutes: settingTime.difference(nowTime).inMinutes,
                    );
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => my_pet_note(
                                account: widget.account,
                                password: widget.password,
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
                              remind: remind,

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

  bool nameIsEmpty()  {
    print(petName.text);
    if (petName.text  == "") {
      return true;
    }
    return false;
  }

  Future<void> btnEvent() async {
    final data = <String, dynamic>{
      "petName" : petName.text,
      "doingThing" : doingThing.text,
      "remark" : remark.text,
      "setYear" : setYear.text,
      "setMonth" : setMonth.text,
      "setDay" : setDay.text,
      "setHour" : setHour.text,
      "setMinute" : setMinute.text,
      "remind" : remind.remind.toString(),
    };
    try {
      //EasyLoading.show(status: 'loading...');

      var users =
      FirebaseFirestore.instance.collection('UserInformation').doc(widget.account);
      var docSnapshot = await users.get();
      Map<String, dynamic>? user_data = docSnapshot.data();

      if ( user_data!.keys.toList().contains("pet_note_array") == false)
      {
        users.update({"pet_note_array" : [data] });
      }
      else {
        user_data["pet_note_array"].add(data);
        users.update({"pet_note_array" :user_data["pet_note_array"] });
      }



    } on FirebaseAuthException catch (e) {
      //EasyLoading.dismiss();

    } catch (e) {
      //EasyLoading.dismiss();
      print(e);
    }


    //EasyLoading.dismiss();
    Fluttertoast.showToast(msg: "更新資料成功");

    // Navigator.pop(context);
  }
  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNoticationListener);

  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => SecondScreen(payload: payload))));
    }
  }

}
