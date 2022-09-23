import 'package:flutter/material.dart';
import 'package:firebase_test/palatte.dart';

class TextInputs extends StatelessWidget {
  const TextInputs({
    Key? key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.errorText,
    this.controllers,
  }) : super(key: key);

  final IconData? icon;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? errorText;
  final TextEditingController? controllers;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade600.withOpacity(0.5),
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
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
          showCursor: true,
          controller: controllers,
        ),
      ),
    );
  }
}