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

class pet_remind_note extends StatefulWidget {
  const pet_remind_note({
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

  final TextEditingController petNameControllers;
  final TextEditingController doingThingsControllers;
  final TextEditingController remark ;
  final TextEditingController setYear ;
  final TextEditingController setMonth ;
  final TextEditingController setDay ;
  final TextEditingController setHour ;
  final TextEditingController setMinute ;
  final RemindBool remind;

  @override
  State<pet_remind_note> createState() => _pet_remind_note(
        petNameControllers: petNameControllers,
        doingThingsControllers: doingThingsControllers,
        remark: remark,
        setYear: setYear,
        setMonth: setMonth,
        setDay: setDay,
        setHour: setHour,
        setMinute: setMinute,
      );
}

class _pet_remind_note extends State<pet_remind_note> {
  _pet_remind_note({
    Key? key,
    required this.petNameControllers,
    required this.doingThingsControllers,
    required this.remark,

    required this.setYear,
    required this.setMonth,
    required this.setDay,
    required this.setHour,
    required this.setMinute,
  });

  final TextEditingController petNameControllers;
  final TextEditingController doingThingsControllers;
  final TextEditingController remark ;
  final TextEditingController setYear ;
  final TextEditingController setMonth ;
  final TextEditingController setDay ;
  final TextEditingController setHour ;
  final TextEditingController setMinute ;

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

  void tune_time_list(
      int? year, int? month, int? day, int? hours, int? minute) {
    if (year != null) {
      int leapYearNum = isLeapYear(year + 1911);
      dayList = List<int>.generate(
          noLeapMonthDay[monthDropDownValue], (int index) => index + 1);
      if (monthDropDownValue == 2 && leapYearNum == 1) {
        dayList.add(29);
      }

      if (dayList.last < dayDropDownValue) {
        dayDropDownValue = dayList.last;
      }
      yearDropDownValue = year;
    } else if (month != null) {
      int leapYearNum = isLeapYear(yearDropDownValue + 1911);
      monthDropDownValue = month;
      dayList = List<int>.generate(
          noLeapMonthDay[monthDropDownValue], (int index) => index + 1);
      if (monthDropDownValue == 2 && leapYearNum == 1) {
        dayList.add(29);
      }

      if (dayList.last < dayDropDownValue) {
        dayDropDownValue = dayList.last;
      }
    } else if (day != null) {
      dayDropDownValue = day;
    } else if (hours != null) {
      hoursDropDownValue = hours;
    } else if (minute != null) {
      minuteDropDownValue = minute;
    }
    put_set_time();
  }

  void put_set_time()
  {
    setYear.text = yearDropDownValue.toString();
    setMonth.text = monthDropDownValue.toString();
    setDay.text = dayDropDownValue.toString();
    setHour.text = hoursDropDownValue.toString();
    setMinute.text = minuteDropDownValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    //print(yearDropDownValue);
    //print(monthDropDownValue);
    //print(dayDropDownValue);
    //print(hoursDropDownValue);
    //print(minuteDropDownValue);
    put_set_time();
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
                        child: TextField(
                          decoration: const InputDecoration(
                            //border: InputBorder.none,
                            hintText: "名字",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petNameControllers,
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
              child: Column(
                children: [
                  //代辦事項，文字框
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 2 / 10,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "輸入代辦事項",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: doingThingsControllers,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),

                  //選擇時間，文字
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "選擇時間",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //選擇時間，按鈕
                  Container(
                    child: Row(
                      children: [
                        //年
                        Container(
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              //isExpanded: true,
                              dropdownColor: Colors.grey,
                              items: yearList
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              value: yearDropDownValue,
                              menuMaxHeight: 48 * 5,
                              icon: const Icon(null),
                              onChanged: (int? value) {
                                setState(() {
                                  tune_time_list(
                                    value!,
                                    null,
                                    null,
                                    null,
                                    null,
                                  );
                                });
                              },
                            ),
                          ),
                        ),

                        //月
                        Container(
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              //isExpanded: true,
                              dropdownColor: Colors.grey,
                              items: monthList
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              value: monthDropDownValue,
                              menuMaxHeight: 48 * 5,
                              icon: const Icon(null),
                              onChanged: (int? value) {
                                setState(() {
                                  tune_time_list(
                                    null,
                                    value!,
                                    null,
                                    null,
                                    null,
                                  );
                                });
                              },
                            ),
                          ),
                        ),

                        //日
                        Container(
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              //isExpanded: true,
                              dropdownColor: Colors.grey,
                              items: dayList
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              value: dayDropDownValue,
                              menuMaxHeight: 48 * 5,
                              icon: const Icon(null),
                              onChanged: (int? value) {
                                setState(() {
                                  tune_time_list(
                                    null,
                                    null,
                                    value!,
                                    null,
                                    null,
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        //時
                        Container(
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              //isExpanded: true,
                              dropdownColor: Colors.grey,
                              items: hoursList
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              value: hoursDropDownValue,
                              menuMaxHeight: 48 * 5,
                              icon: const Icon(null),
                              onChanged: (int? value) {
                                setState(() {
                                  tune_time_list(
                                    null,
                                    null,
                                    null,
                                    value!,
                                    null,
                                  );
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 5,
                        ),
                        //分
                        Container(
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              //isExpanded: true,
                              dropdownColor: Colors.grey,
                              items: minuteList
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              value: minuteDropDownValue,
                              menuMaxHeight: 48 * 5,
                              icon: const Icon(null),
                              onChanged: (int? value) {
                                setState(() {
                                  tune_time_list(
                                    null,
                                    null,
                                    null,
                                    null,
                                    value!,
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //開啟提醒，文字加按鈕
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "開起提醒",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          flex: 3,
                        ),

                        Expanded(
                          child:  CupertinoSwitch(
                            // This bool value toggles the switch.
                            value: widget.remind.remind,
                            //thumbColor: CupertinoColors.systemBlue,
                            //trackColor: CupertinoColors.systemRed.withOpacity(0.14),
                            //activeColor: CupertinoColors.systemRed.withOpacity(0.64),
                            onChanged: (bool? value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                widget.remind.remind = value!;
                              });
                            },
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),

                  //備註，文字框
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 10,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "備註",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: remark,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
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
