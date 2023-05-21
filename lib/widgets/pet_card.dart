// 資料卡介面

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_test/palatte.dart';
import 'package:firebase_test/widgets/SimpleCamera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';

class pet_card extends StatefulWidget {
   pet_card({
    Key? key,
    required this.petName,
    required this.petRace,
    required this.petSex,
    required this.petBirthday,
    required this.petLength,
    required this.petWeight,
    required this.remark,
    this.erase = false,

  }) : super(key: key);

  final TextEditingController petName;
  final TextEditingController petRace;
  final TextEditingController petSex;
  final TextEditingController petBirthday;
  final TextEditingController petLength;
  final TextEditingController petWeight;
  final TextEditingController remark;
  bool erase;
  bool eraseState = false;

  @override
  State<pet_card> createState() => _pet_card(
        petName: petName,
        petRace: petRace,
        petSex: petSex,
        petBirthday: petBirthday,
        petLength: petLength,
        petWeight: petWeight,
        remark: remark,
      );
}

class _pet_card extends State<pet_card> {
  _pet_card({
    Key? key,
    required this.petName,
    required this.petRace,
    required this.petSex,
    required this.petBirthday,
    required this.petLength,
    required this.petWeight,
    required this.remark,

  });

  final TextEditingController petName;
  final TextEditingController petRace;
  final TextEditingController petSex;
  final TextEditingController petBirthday;
  final TextEditingController petLength;
  final TextEditingController petWeight;
  final TextEditingController remark;


  @override
  Widget build(BuildContext context) {
    void openCamera(BuildContext context) async {
      final cameras = await availableCameras();
      Navigator.push(
        this.context,
        MaterialPageRoute(
          builder: (context) => SimpleCamera(
            camera: cameras.first,
            petName: widget.petName.text,
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
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
                    FutureBuilder<Image>(
                      future: _getAvatar(),
                      builder: (context, snapshot) {
                        return InkWell(
                          onTap: () {
                            openCamera(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            //color: Colors.white,
                            width: MediaQuery.of(context).size.width * 1 / 4,
                            height: MediaQuery.of(context).size.height * 2 / 23,
                            // pet image
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow.shade300,
                            ),
                            child: ClipOval(child: snapshot.data),
                          ),
                        );
                      },
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
                          controller: petName,
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
                  //種族，文字框
                  Text("品種："),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petRace,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //性別，文字框
                  Text("性別："),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petSex,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //生日，文字框
                  Text("生日："),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petBirthday,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //體長，文字框
                  Text("體長："),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petLength,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //體重，文字框
                  Text("體重："),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: petWeight,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //備註，文字框
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 15,
                        child: TextField(
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(
                    height: 20,
                  ),
                  deleteBtn(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget deleteBtn(){
    if (widget.erase){
      return //開啟提醒，文字加按鈕
        Container(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "刪除",
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
                  value: widget.eraseState,
                  //thumbColor: CupertinoColors.systemBlue,
                  //trackColor: CupertinoColors.systemRed.withOpacity(0.14),
                  //activeColor: CupertinoColors.systemRed.withOpacity(0.64),
                  onChanged: (bool? value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      widget.eraseState = value!;
                    });
                  },
                ),
                flex: 1,
              ),
            ],
          ),
        );
    }
    return const SizedBox();
  }

  Future<Image> _getAvatar() async {
    final path = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getApplicationDocumentsDirectory()).path,
      '${widget.petName.text}.png',
    );

    print("get file from: $path");

    return await (File(path).exists())
        ? Image.file(
            File(path),
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/img_cat1.png',
            fit: BoxFit.cover,
          );
  }
}
