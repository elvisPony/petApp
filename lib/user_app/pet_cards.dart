// 寵物資料卡一覽
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';

import 'package:firebase_test/user_app/add_pet_card_page.dart';
import 'package:firebase_test/widgets/pet_card.dart';


const primaryColor = Color(0xFFedc96c);

class my_pet_cards extends StatefulWidget {

  final String account ;
  final String password ;

  const my_pet_cards({
  super.key,
  required this.account,
  required this.password,
  });



  @override
  State<my_pet_cards> createState() => _my_pet_cards(
  );
}





class _my_pet_cards extends State<my_pet_cards> {


  List all_card = <Widget>[] ;

  String petName= '';
  String petRace = '';
  String petSex= '';
  String petBirthday ='';
  String petLength = '';
  String petWeight = '';
  String remark = '';



  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection('UserInformation').doc(
        widget.account);

    return FutureBuilder<DocumentSnapshot>(future: users.get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> docSnapshot) {
          Map<String, dynamic> user_data = docSnapshot.data!.data() as Map<
              String,
              dynamic>;
          List temp;
          if (all_card.length == 0) {
            temp = user_data["pet_card_array"];
            for (var it in temp) {
              TextEditingController petName = TextEditingController();
              TextEditingController petRace = TextEditingController();
              TextEditingController petSex = TextEditingController();
              TextEditingController petBirthday = TextEditingController();
              TextEditingController petLength = TextEditingController();
              TextEditingController petWeight = TextEditingController();
              TextEditingController remark = TextEditingController();

              petName.text = it['petName'];
              petRace.text = it['petRace'];
              petSex.text = it['petSex'];
              petBirthday.text = it['petBirthday'];
              petLength.text = it['petLength'];
              petWeight.text = it['petWeight'];
              remark.text = it['remark'];

              all_card.add(pet_card(
                petName: petName,
                petRace: petRace,
                petSex: petSex,
                petBirthday: petBirthday,
                petLength: petLength,
                petWeight: petWeight,
                remark: remark,
              ));
              all_card.add(const SizedBox(height: 10,
              ));
            }
          }
          return Stack(
            children: [
              BackgroundImage(),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: primaryColor,
                  title: const Text(
                    "寵物資料卡一覽",
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
                              builder: (context) =>
                                  petIndex(
                                    account: widget.account,
                                    password: widget.password,
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
                                builder: (context) =>
                                    add_pet_card_page(
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
                          height: 10,
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ...all_card
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
        });
  }

}
