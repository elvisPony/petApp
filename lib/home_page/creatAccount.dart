//  建立新帳號介面

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_test/home_page/login_page.dart';
import 'package:firebase_test/widgets/password-input.dart';
import 'package:firebase_test/widgets/text-input.dart';
import 'package:firebase_test/widgets/background-image.dart';

class creatAccountPage extends StatefulWidget {
  creatAccountPage({Key? key}) : super(key: key);

  @override
  _creatAccountPage createState() => _creatAccountPage();
}

class _creatAccountPage extends State<creatAccountPage> {
  final TextEditingController nickName = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController checkPassword = TextEditingController();

  UserCredential? userCredentials;

  bool passwordOk = false;
  List<String> error = ["", "", "", ""];

  @override
  void initState() {
    super.initState();
    nickName.text = "";
    accountController.text = "";
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
                              hint: '帳戶暱稱',
                              inputType: TextInputType.name,
                              inputAction: TextInputAction.next,
                              controllers: nickName,
                              //errorText: error[0],
                            ),
                            TextInputs(
                              hint: '電子郵件',
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              controllers: accountController,
                              //errorText: error[1],
                            ),
                            PasswordInput(
                              hint: '密碼',
                              inputAction: TextInputAction.next,
                              controllers: password,
                              //errorText: error[2],
                            ),
                            PasswordInput(
                              hint: '確認密碼',
                              inputAction: TextInputAction.none,
                              controllers: checkPassword,
                              //errorText: validatePassword(checkPassword.text),
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
                                color: Colors.blue,//Colors.grey.shade600.withOpacity(0.5)
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
                                  String temp;
                                  temp = validatePassword(checkPassword.text);
                                  print("debug : " + passwordOk.toString());
                                  if (passwordOk) {
                                    btnEvent(nickName.text,
                                        accountController.text, password.text);
                                  } else {
                                    Fluttertoast.showToast(
                                      backgroundColor: Colors.grey,
                                      msg: temp,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                    );
                                  }
                                },
                                child: const Text('建立帳號'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.blue,//Colors.grey.shade600.withOpacity(0.5)
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
                                          builder: (context) => LoginPage()));
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

  String validatePassword(String s) {
    if (password.text != s) {
      setState(() {
        passwordOk = false;
      });
      return "密碼不相同";
    } else
      passwordOk = true;
    return "";
  }

  Future<void> btnEvent(
    String _username,
    String _account,
    String _password,
  ) async {

    if (passwordOk == false) return;
    try {
      //EasyLoading.show(status: 'loading...');

      CollectionReference users =
          FirebaseFirestore.instance.collection('UserInformation');
      DocumentSnapshot doc = await users.doc(_account).get();

      if (doc.data() != null) {
        Fluttertoast.showToast(msg: "這個信箱已被使用，請用其他信箱嘗試",backgroundColor: Colors.grey,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER, );
        // Fluttertoast.showToast(
        //   backgroundColor: Colors.grey,
        //   msg: "信箱已使用，請用其他信箱嘗試",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.CENTER,
        // );
        return;
      }
      await users
          .doc(_account)
          .set(
              {"email": _account, "username": _username, "password": _password})
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      print(_account);
      print(_password);
      userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _account, password: _password);
      User? user = userCredentials?.user;
      user?.updateDisplayName(_username);
    } on FirebaseAuthException catch (e) {
      //EasyLoading.dismiss();
      print('錯誤');
      print(e.code);
       if (e.code == 'email-already-in-use') {

        setState(() {
          error[1] = 'The account already exists for that email.';
        });
        print('The account already exists for that email.');
      }
    } catch (e) {
      //EasyLoading.dismiss();
      print(e);
    }
    print(userCredentials);

    //EasyLoading.dismiss();
    Fluttertoast.showToast(msg: "創建帳號成功",backgroundColor: Colors.grey,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,);

    // Navigator.pop(context);
  }
}
