import 'package:flutter/material.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';
import 'package:projcet_cv/views/Create%20CV/personal_edit_view.dart';
import 'package:projcet_cv/views/Edit%20CV/cv_view.dart';
import 'package:projcet_cv/widgets/header_widget.dart';
import 'package:projcet_cv/widgets/section_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          WelcomeHeader(),
          size120,
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionCard(
                      image: 'assets/image/Personal data-rafiki.png',
                      title: 'Create Your CV',
                      onTap: () {
                        context.push_(context, PersonalView());
                      },
                    ),
                    SectionCard(
                      image: 'assets/image/Ebook-bro.png',
                      title: 'Edit Your CV',
                      onTap: () {
                        context.push_(context, PersonalView2());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
