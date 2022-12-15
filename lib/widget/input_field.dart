import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  final double symmetricHorizontalPadding;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const InputField({Key? key, required this.symmetricHorizontalPadding,
    required this.hintText, required this.controller, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: symmetricHorizontalPadding),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red.shade900),
              borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText
                ),
              )
          )
      ),
    );
  }
}