

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';

class WelcomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(context) / 6,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Platzi.helpColor, Platzi.mainColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Your CV',
            style: GoogleFonts.abel(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          size6,
          Text(
            'Unlock your potential and stand out from the crowd by crafting your professional story with a captivating CV today!',
            style: GoogleFonts.abel(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
