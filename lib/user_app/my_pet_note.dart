// 目錄
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';
import 'package:firebase_test/user_app/add_pet_note_page.dart';
import 'package:firebase_test/widgets/show_note.dart';
import 'package:flutter/cupertino.dart';


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
  State<my_pet_note> createState() => _my_pet_note();
}





class _my_pet_note extends State<my_pet_note> {

  // final String account ;
  // final String password ;
  //
  // _my_pet_note({
  // required this.account,
  // required this.password,
  // });

  List all_note = <Widget>[] ;

  String petNameControllers= '';
  String doingThingsControllers = '';
  String remark= '';
  String setYear ='';
  String setMonth = '';
  String setDay = '';
  String setHour = '';
  String setMinute ='';
  bool remind = false;

  @override
  void initState()  {
    // TODO: implement setState
    super.initState();

  }

  @override
  Widget build(BuildContext context)  {
    var users = FirebaseFirestore.instance.collection('UserInformation').doc(widget.account);

    return FutureBuilder<DocumentSnapshot>(future: users.get() ,
        builder: (BuildContext  context, AsyncSnapshot<DocumentSnapshot> docSnapshot ){
          Map<String, dynamic> user_data = docSnapshot.data!.data() as Map<String, dynamic> ;
          List temp;
          all_note = <Widget>[];
          if ( user_data!.keys.toList().contains("pet_note_array") == false)
          {

          }
          else{
            temp = user_data["pet_note_array"];
            for (var it in temp ){
              petNameControllers = it['petName'];
              doingThingsControllers = it['doingThing'];
              remark = it['remark'];
              setYear = it['setYear'];
              setMonth = it['setMonth'];
              setDay = it['setDay'];
              setHour = it['setHour'];
              setMinute = it['setMinute'];
              remind = it['remind'] == 'true';
              all_note.add(Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width  / 100),
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
                                  child: Text(petNameControllers,
                                      textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize:40 )),
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
                                child: Text(setYear +"/" + setMonth +"/"+ setDay +" " + doingThingsControllers )
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


              ));
              all_note.add(SizedBox(
                height: 10,
              ));
            }
          }
          return   Stack(
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
                                builder: (context) =>  add_pet_note_page(
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ...all_note
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
        } );


  }


  Future<void> get_pet_card()async{
    //print("hi");
    List temp;
    var users =
    FirebaseFirestore.instance.collection('UserInformation').doc(widget.account);
    var docSnapshot = await users.get();
    Map<String, dynamic>? user_data = docSnapshot.data();
    if ( user_data!.keys.toList().contains("pet_note_array") == false)
    {
      return;
    }
    else{
      temp = user_data["pet_note_array"];
      for (var it in temp ){
        print(it);
        petNameControllers = it['petName'];
        doingThingsControllers = it['doingThing'];
        remark = it['remark'];
        setYear = it['setYear'];
        setMonth = it['setMonth'];
        setDay = it['setDay'];
        setHour = it['setHour'];
        setMinute = it['setMinute'];
        remind = it['remind'] == 'true';
        all_note.add(Container(
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
                            child: Text(petNameControllers),
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
                          child: Text(setYear +"/" + setMonth +"/"+ setDay +" " + doingThingsControllers )
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


        ));
        all_note.add(SizedBox(
          height: 10,
        ));
      }
    }

    return;
  }


  Widget element(BuildContext context){
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
                        child: Text(petNameControllers),
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
                      child: Text(setYear +"/" + setMonth +"/"+ setDay +" " + doingThingsControllers )
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

