import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcet_cv/helper/constant/color.dart';
import 'package:projcet_cv/helper/constant/spece.dart';
import 'package:projcet_cv/helper/extensions/assistant.dart';
import 'package:projcet_cv/views/Login/bloc/authentication_bloc.dart';
import 'package:projcet_cv/views/SingUp/sign_up_view.dart';
import 'package:projcet_cv/widgets/alert_dialog.dart';
import 'package:projcet_cv/widgets/bottom_nav_bar.dart';
import 'package:projcet_cv/widgets/text_field_widget.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SuccessState) {
            context.push(context, BottomNavBarr());
          } else if (state is ErrorState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(content: "Wrong");
              },
            );
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              SizedBox(
                height: context.getHeight(context),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(20, -1.2),
                      child: Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Platzi.helpColor)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-2.7, -1.2),
                      child: Container(
                          height: MediaQuery.of(context).size.width / 1.3,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Platzi.mainColor)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(2.7, -1.2),
                      child: Container(
                          height: MediaQuery.of(context).size.width / 1.3,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Platzi.subColor)),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: context.getHeight(context) / 1.4,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("Hey,\nLogin Now",
                                    style: GoogleFonts.alata(
                                        fontSize: 30,
                                        color: Platzi.oceanColor)),
                              ),
                              size24,
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
                              size48,
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<AuthenticationBloc>().add(
                                        SignInEvent(
                                            email: emailController.text,
                                            password: passwordController.text));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Platzi.mainColor,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width,
                                          50)),
                                  child: Text('Sign in',
                                      style: GoogleFonts.alata(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomAlertDialog(
                                            content: 'Nothing',
                                            onPositivePressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: GoogleFonts.aboreto(
                                          color: Platzi.mainColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  size24,
                                  TextButton(
                                    onPressed: () {
                                      context.push(context, SignUpView());
                                    },
                                    child: Text(
                                      "Create an account",
                                      style: GoogleFonts.aboreto(
                                          color: Platzi.oceanColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
