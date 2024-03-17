import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/model/cv.dart';

class CustomListTile extends StatelessWidget {
  final CV? cv;
  final VoidCallback? onPressed;

  const CustomListTile({
     this.cv,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "cv!.title",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}