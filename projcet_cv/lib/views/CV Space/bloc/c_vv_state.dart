part of 'c_vv_bloc.dart';

@immutable
sealed class CVvState {}

final class CVvInitial extends CVvState {}

// ignore: must_be_immutable
class SuccessCvState extends CVvState {
   List<CV> cv = [];
  SuccessCvState(this.cv);
}

class ErrorState extends CVvState{
   final String errorMessage;

  ErrorState(this.errorMessage);
}
