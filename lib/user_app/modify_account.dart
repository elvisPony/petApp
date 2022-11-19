//  建立新帳號介面

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_test/home_page/login_page.dart';
import 'package:firebase_test/widgets/password-input.dart';
import 'package:firebase_test/widgets/text-input.dart';
import 'package:firebase_test/widgets/background-image.dart';
import 'package:firebase_test/user_app/personal_user_index.dart';

class ModifyAccount extends StatefulWidget {
  const ModifyAccount({
  super.key,
  required this.account,
  required this.password,
});

  final String account;
  final String password;
  @override
  State<ModifyAccount> createState() => _ModifyAccount();
}

class _ModifyAccount extends State<ModifyAccount> {
  final TextEditingController nickName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController checkPassword = TextEditingController();

  UserCredential? userCredentials;

  bool passwordOk = false;
  List<String> error = ["", "", "", ""];

  @override
  void initState() {
    super.initState();
    nickName.text = "";
    password.text = "";
    checkPassword.text = "";
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInputs(
                              hint: '新的帳戶暱稱',
                              inputType: TextInputType.name,
                              inputAction: TextInputAction.next,
                              controllers: nickName,
                              errorText: error[0],
                            ),

                            PasswordInput(
                              hint: '新密碼',
                              inputAction: TextInputAction.next,
                              controllers: password,
                              errorText: error[1],
                            ),
                            PasswordInput(
                              hint: '再次輸入密碼',
                              inputAction: TextInputAction.none,
                              controllers: checkPassword,
                              errorText: error[2],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  String temp = "";
                                  temp = validatePassword(checkPassword.text);
                                  if (nickName.text == ""){
                                    passwordOk = false;
                                    temp += "匿名不為空 ";
                                  }

                                  if (passwordOk) {
                                    btnEvent(nickName.text, password.text);
                                  } else {
                                    Fluttertoast.showToast(
                                      backgroundColor: Colors.grey,
                                      msg: temp,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                    );
                                  }
                                },
                                child: const Text('更新資料'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: ()   {
                                   showAlertDialog(context);
                                },
                                child: const Text('刪除帳號'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.black,
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => petIndex(
                                            account: widget.account,
                                            password: widget.password,
                                          )));
                                },
                                child: const Text('返回'),
                              ),
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

  String validatePassword(String s)  {

    if (password.text != s || password.text == "") {
      setState(() {
        passwordOk = false;
      });
      return "密碼錯誤或為空 ";
    } else
      passwordOk = true;
    return "";
  }
  showAlertDialog(BuildContext context)  {
    AlertDialog dialog = AlertDialog(
      title: const Text("是否刪除帳號"),
      actions: [
        ElevatedButton(
            onPressed: (){
              deleteAccount();
              
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));
            },
            child: const Text("是")),
        ElevatedButton(
            onPressed: (){
  
              Navigator.pop(context);
              },
            child: const Text("取消")),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){return dialog;});
  }

  Future<void> deleteAccount()async{
    var users =
    FirebaseFirestore.instance.collection('UserInformation');
    await users.doc(widget.account).delete();

  }

  Future<void> btnEvent(
      String _username,
      String _password,
      ) async {
    if (passwordOk == false) return;
    try {
      //EasyLoading.show(status: 'loading...');

      CollectionReference users =
      FirebaseFirestore.instance.collection('UserInformation');
      DocumentSnapshot doc = await users.doc(widget.account).get();
      if (doc.data() != null) {
        await users
            .doc(widget.account)
            .update(
            { "username": _username, "password": _password})
            .catchError((error) => print("Failed to update user: $error"));
      }
      return;



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
}
