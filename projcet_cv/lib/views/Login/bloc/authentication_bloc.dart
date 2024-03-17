import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:projcet_cv/data/data_layer.dart';
import 'package:projcet_cv/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final locator = GetIt.I.get<HomeData>();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignInEvent>(onSignIn);
    on<SignOutEvent>(onSignOut);
    
  }

  FutureOr<void> onSignIn(
      SignInEvent event, Emitter<AuthenticationState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(ErrorState("Please provide both email and password."));
      return null;
    }

    try {
      final id =
          await Database().signIn(email: event.email, password: event.password);
      locator.token = Database().supabase.auth.currentSession!.accessToken;
      locator.addToken();
      locator.id = id;
      emit(
          SuccessState("The sign-up process has been completed successfully."));
    } on AuthException catch (e) {
      emit(ErrorState(
          "Oops! It seems the information provided is incorrect. Please double-check your email and password$e."));
    }
  }

  FutureOr<void> onSignOut(
      SignOutEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await Database().logOut();
      locator.removeToken();
      emit(SuccessState("Sign Out successfully"));
    } catch (e) {
      emit(ErrorState("Something went wrong"));
    }
  }
}
