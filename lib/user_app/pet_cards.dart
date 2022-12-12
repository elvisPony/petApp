// 寵物資料卡一覽
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/user_app/add_pet_card_page.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/widgets/pet_card.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFedc96c);

class my_pet_cards extends StatefulWidget {
  final String account;

  final String password;

  const my_pet_cards({
    super.key,
    required this.account,
    required this.password,
  });

  @override
  State<my_pet_cards> createState() => _MyPetCardsState();
}

class _MyPetCardsState extends State<my_pet_cards> {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
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
                        builder: (context) => petIndex(
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
                          builder: (context) => add_pet_card_page(
                                account: widget.account,
                                password: widget.password,
                              )));
                },
              ),
            ],
          ),
          body: StreamBuilder<DocumentSnapshot>(
            stream: _fireStore.collection('UserInformation').doc(widget.account).snapshots(),
            builder: (context, snapshot) {
              List<pet_card> petCardWidget = [];
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final petCardList = (snapshot.data?.data() as dynamic)['pet_card_array'];

              if (petCardList == null) {
                return const Center(
                  child: Text("請嘗試新增寵物!"),
                );
              }

              for (var petCard in petCardList) {
                TextEditingController petName = TextEditingController();
                TextEditingController petRace = TextEditingController();
                TextEditingController petSex = TextEditingController();
                TextEditingController petBirthday = TextEditingController();
                TextEditingController petLength = TextEditingController();
                TextEditingController petWeight = TextEditingController();
                TextEditingController remark = TextEditingController();

                petName.text = petCard['petName'];
                petRace.text = petCard['petRace'];
                petSex.text = petCard['petSex'];
                petBirthday.text = petCard['petBirthday'];
                petLength.text = petCard['petLength'];
                petWeight.text = petCard['petWeight'];
                remark.text = petCard['remark'];

                final widget = pet_card(
                    petName: petName,
                    petRace: petRace,
                    petSex: petSex,
                    petBirthday: petBirthday,
                    petLength: petLength,
                    petWeight: petWeight,
                    remark: remark);

                petCardWidget.add(widget);
              }

              return ListView(children: petCardWidget);
            },
          ),
        )
      ],
    );
  }
}
