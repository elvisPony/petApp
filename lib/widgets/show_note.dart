import 'package:flutter/material.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/palatte.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_test/user_app/add_pet_note_page.dart';
int isLeapYear(int year) {
  if ((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)))
    return 1;
  else
    return 0;
}

final year = DateTime.now().year - 1911;
final nowMonth = DateTime.now().month;
final nowDay = DateTime.now().day;
final isLeapYearInt = isLeapYear(year);
final monthNumDay = [
  0,
  31,
  28 + isLeapYearInt,
  31,
  30,
  31,
  30,
  31,
  31,
  30,
  31,
  30,
  31
];
final noLeapMonthDay = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

class show_pet_note extends StatefulWidget {
  const show_pet_note({
    Key? key,
    required this.petNameControllers,
    required this.doingThingsControllers,
    required this.remark,

    required this.setYear,
    required this.setMonth,
    required this.setDay,
    required this.setHour,
    required this.setMinute,
    required this.remind,

  }) : super(key: key);

  final String petNameControllers;
  final String doingThingsControllers;
  final String remark ;
  final String setYear ;
  final String setMonth ;
  final String setDay ;
  final String setHour ;
  final String setMinute ;
  final String remind;

  @override
  State<show_pet_note> createState() => _show_pet_note(

  );
}

class _show_pet_note extends State<show_pet_note> {




  List<int> yearList = List<int>.generate(100, (int index) => index + year);
  List<int> monthList = List<int>.generate(12, (int index) => index + 1);
  List<int> dayList =
  List<int>.generate(monthNumDay[nowMonth], (int index) => index + 1);
  int yearDropDownValue = year;
  int monthDropDownValue = nowMonth;
  int dayDropDownValue = nowDay;

  List<int> hoursList = List<int>.generate(24, (int index) => index);
  List<int> minuteList = List<int>.generate(60, (int index) => index);
  int hoursDropDownValue = 0;
  int minuteDropDownValue = 0;
  bool remind = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remind = widget.remind == 'true';
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      child: Column(
        children: <Widget>[
          //名字欄
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.blue,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width * 1 / 4,
                      height: MediaQuery.of(context).size.height * 2 / 23,
                      // pet image
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow.shade300,
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_cat1.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height * 2 / 19,
                        child: Text(widget.petNameControllers,
                            textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //事項欄
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.white.withOpacity(0.95),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(widget.setYear +"/" + widget.setMonth +"/"+ widget.setDay +" " + widget.doingThingsControllers,

                    )
                  ),
                  Expanded(
                    child:  CupertinoSwitch(
                      // This bool value toggles the switch.
                      value: remind,
                      //thumbColor: CupertinoColors.systemBlue,
                      //trackColor: CupertinoColors.systemRed.withOpacity(0.14),
                      //activeColor: CupertinoColors.systemRed.withOpacity(0.64),
                      onChanged: (bool? value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          remind = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
