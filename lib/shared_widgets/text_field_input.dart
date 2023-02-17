import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final double width;
  final String hintText;
  final TextInputType textInputType;
  final IconData iconData;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.isPass,
      required this.textEditingController,
      required this.textInputType,
      required this.iconData,
      required this.width});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return SizedBox(
      width: width,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            hintText: hintText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            contentPadding: const EdgeInsets.all(8),
            fillColor: Colors.blueGrey[400]),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
