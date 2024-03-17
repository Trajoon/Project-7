part of 'all_cv_bloc.dart';

@immutable
sealed class AllCvState {}

final class AllCvInitial extends AllCvState {}

// ignore: must_be_immutable
class SuccessAllCvState extends AllCvState {
   List<CV> cv = [];
  SuccessAllCvState(this.cv);
}

class ErrorState extends AllCvState{
   final String errorMessage;

  ErrorState(this.errorMessage);
}