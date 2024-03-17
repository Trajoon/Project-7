import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/model/cv.dart';

class CVSpace extends StatelessWidget {
  const CVSpace({super.key, this.cvInfo});
  final CV? cvInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            size24,
            Text(
              cvInfo!.name,
              style: GoogleFonts.alata(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              cvInfo!.degree,
              style: GoogleFonts.abel(
                  color: Colors.grey.shade400,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ), // degree
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(cvInfo!.email),
                Text(cvInfo!.phone),
                Text(cvInfo!.address),
              ],
            ),
            const Divider(
              thickness: 4,
              color: Colors.black,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Text(cvInfo!.summary),
              size12,
              const Text(
                "Eduction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cvInfo!.institution),
                  Text(cvInfo!.graduationYear),
                ],
              ),
              Text(cvInfo!.degree),
              size12,
              size12,
              const Text(
                "Experience",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cvInfo!.jobTitle),
                  Text(cvInfo!.period),
                ],
              ),
              size12,
              const Text(
                "Project",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Text(cvInfo!.projectTitle),
              size12,
              const Text(
                "Skill",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Text(cvInfo!.skill),
              size12,
              const Text(
                "Language",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Text(cvInfo!.language),
            ],
          ),
        ),
      ],
    );
  }
}
