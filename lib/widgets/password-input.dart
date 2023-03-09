import 'package:flutter/material.dart';
import 'package:firebase_test/palatte.dart';



class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    @required this.icon,
    @required this.hint,
    this.inputAction,
    this.errorText,
    this.controllers,
  }) : super(key: key);

  final IconData? icon;
  final String? hint;
  final TextInputAction? inputAction;
  final String? errorText;
  final TextEditingController? controllers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,//Colors.grey.shade600.withOpacity(0.5)
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            errorText: errorText,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          obscureText: true,
          style: kBodyText,
          textInputAction: inputAction,
          controller: controllers,
        ),
      ),
    );
  }
}