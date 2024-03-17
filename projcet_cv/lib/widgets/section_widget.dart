import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';

class SectionCard extends StatelessWidget {
   SectionCard({super.key, required this.image, required this.title, this.onTap});
  final String image;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 150, 
            height: 250, 
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey.withOpacity(0.1), width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), 
              child: Image.asset(
                image, 
                fit: BoxFit
                    .cover, 
              ),
            ),
          ),
        ),
        Text(title,
            style: GoogleFonts.alata(fontSize: 20, color: Platzi.oceanColor))
      ],
    );
  }
}
