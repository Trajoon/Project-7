part of 'cv_bloc.dart';

@immutable
sealed class CvEvent {}

class addInfoEvent extends CvEvent {
  final String name;
  final String summary;
  final String phone;
  final String email;
  final String address;
  final String institution;
  final String graduationYear;
  final String jobTitle;
  final String company;
  final String period;
  final String skill;
  final String language;
  final String project;
  final String degree;
  final String title;

  addInfoEvent({
    required this.name,
    required this.summary,
    required this.phone,
    required this.email,
    required this.address,
    required this.institution,
    required this.graduationYear,
    required this.jobTitle,
    required this.company,
    required this.period,
    required this.skill,
    required this.language,
    required this.project,
    required this.degree,
    required this.title,
  });

  
}
