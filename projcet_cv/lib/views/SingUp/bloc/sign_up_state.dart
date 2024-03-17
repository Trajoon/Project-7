part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class LoadingState extends SignUpState {}

class SuccessState extends SignUpState {
  final String message;

  SuccessState(this.message);
}

class ErrorState extends SignUpState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}