import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projcet_cv/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAccountEvent>(onSignUp);
  }

  Future<void> onSignUp(
      CreateAccountEvent event, Emitter<SignUpState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(ErrorState("Please provide both email and password."));
      return;
    }

    try {
      await Database().signUp(email: event.email, password: event.password);
      emit(
          SuccessState("The sign-up process has been completed successfully."));
    } on AuthException catch (e) {
      emit(ErrorState(
          "An error occurred during the sign-up process: ${e.toString()}"));
    } 
  }
}
