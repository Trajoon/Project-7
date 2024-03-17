import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/All%20User%20CV/bloc/all_cv_bloc.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/model/cv.dart';
import 'package:projcet_cv/views/CV%20Space/bloc/c_vv_bloc.dart';
import 'package:projcet_cv/widgets/cv.dart';

// ignore: must_be_immutable
class AllCVScreen extends StatelessWidget {
  AllCVScreen({super.key});
  CV? cv;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: GoogleFonts.abel(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Platzi.helpColor, Platzi.mainColor],
            ),
          ),
        ),
        elevation: 4,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<AllCvBloc, AllCvState>(
        builder: (context, state) {
          if (state is SuccessAllCvState) {
            return ListView.builder(
                itemCount: state.cv.length,
                itemBuilder: (context, index) {
                  if (state.cv.isNotEmpty) {
                    return CVSpace(cvInfo: state.cv[index]);
                  } else {
                   return Text('No Data');
                  }
                });
          } else {
            return const Center(child: Text("data"));
          }
        },
      ),
    );
  }
}



