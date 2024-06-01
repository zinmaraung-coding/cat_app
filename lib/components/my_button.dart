import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10) ,

        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.all(17),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
