import 'package:flutter/material.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';



class pet_note extends StatelessWidget {
  const pet_note({
    Key? key,
    required this.account ,
    required this.password ,
    required this.headText,
    required this.bodyText,
  }) : super(key: key);

  final String account ;
  final String password ;
  final String headText ;
  final String bodyText ;


  @override
  Widget build(BuildContext context) {
    return InkWell(


      onTap: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>  petIndex(
                  account: account,
                  password: password,
                )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          color:  Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: <Widget>[
            Text(
              headText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 5,
              indent: 5,
            ),
            Text(
              bodyText,
            ),
          ],

        ),

      ),

    );
  }
}