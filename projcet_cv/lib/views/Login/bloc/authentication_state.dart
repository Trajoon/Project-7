part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}


class SuccessState extends AuthenticationState {
  final String message;

  SuccessState(this.message);
}

class ErrorState extends AuthenticationState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}