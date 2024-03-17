import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';

// ignore: must_be_immutable
class CVField extends StatelessWidget {
  CVField({
    Key? key,
    required this.hintText,
    this.isSecure = false,
    this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.minLines = 1,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isSecure;
  int maxLines;
  int minLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Platzi.helpColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .2),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          obscureText: isSecure,
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle:
                  GoogleFonts.actor(color: Platzi.mainColor, fontSize: 15)),
        ),
      ),
    );
  }
}
