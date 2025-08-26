import 'package:flutter/material.dart';
import 'package:formvalidation/pallete.dart';
class LoginFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const LoginFiled({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: const BoxConstraints(
      maxWidth: 350
    ),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.borderColor,
            width: 3
          ),
          borderRadius: BorderRadius.circular(10),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.gradian2,
            width: 3
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: hintText
      ),
      style: TextStyle(color: Colors.white),
    ),
    
    );
  }
}