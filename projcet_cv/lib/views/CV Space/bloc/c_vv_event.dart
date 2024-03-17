part of 'c_vv_bloc.dart';

@immutable
sealed class CVvEvent {}

class DisplayCVEvent extends CVvEvent {}

class UpdateCVEvent extends CVvEvent {
 
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

  UpdateCVEvent({
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

  class DeleteCVEvent extends CVvEvent {
  
}
