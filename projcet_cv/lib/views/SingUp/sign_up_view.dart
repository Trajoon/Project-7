import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';
import 'package:projcet_cv/views/Login/login_view.dart';
import 'package:projcet_cv/views/SingUp/bloc/sign_up_bloc.dart';
import 'package:projcet_cv/widgets/alert_dialog.dart';
import 'package:projcet_cv/widgets/text_field_widget.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SuccessState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                content:
                    "Congratulations! You've successfully become a valued member of our platform.",
                onPositivePressed: () {
                  context.push(context, LoginView());
                },
              );
            },
          );
        } else if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(
                height: context.getHeight(context),
                child: Stack(children: [
                  Align(
                    alignment: const AlignmentDirectional(20, -1.2),
                    child: Container(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Platzi.helpColor)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(20, -1.2),
                    child: Image.asset(
                      'assets/image/logo-removebg-preview.png',
                      width: 220,
                      height: 220,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-2.7, -1.2),
                    child: Container(
                        height: MediaQuery.of(context).size.width / 1.3,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Platzi.mainColor)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(2.7, -1.2),
                    child: Container(
                        height: MediaQuery.of(context).size.width / 1.3,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Platzi.subColor)),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: context.getHeight(context) / 1.4,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "Sign Up\nWelcome! Create an account to get started.",
                                  style: GoogleFonts.actor(
                                      fontSize: 25, color: Platzi.oceanColor)),
                            ),
                            size48,
                            TextAuth(
                              controller: nameController,
                              labelText: "Name",
                              hintText: "Name",
                            ),
                            size12,
                            TextAuth(
                              controller: emailController,
                              labelText: "Email",
                              hintText: "Email",
                            ),
                            size12,
                            TextAuth(
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "Password",
                              isSecure: true,
                            ),
                            size30,
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<SignUpBloc>().add(
                                      CreateAccountEvent(
                                          email: emailController.text,
                                          password: passwordController.text));
                                  Future.delayed(Duration(seconds: 3));
                                  context.push(context, LoginView());
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: Platzi.mainColor,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width, 50)),
                                child: Text(
                                  'Sign up',
                                  style: GoogleFonts.alata(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(context, LoginView());
                              },
                              child: Text(
                                "You Have a account already",
                                style: GoogleFonts.aboreto(
                                    color: Platzi.oceanColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            size18
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
