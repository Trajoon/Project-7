part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}

class DisplayState extends CvState {

}