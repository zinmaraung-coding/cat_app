import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;


  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

      enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(width: 1.2, color: Colors.black),
       borderRadius: BorderRadius.circular(14)
      ),

      focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(width: 1.4, color: Colors.pink),
       borderRadius: BorderRadius.circular(14)

      ),
        hintText: hintText,

      ),
      obscureText: obscureText,
    );
  }
}
