import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:projcet_cv/service/supabase_services.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  final locator = GetIt.I.get<Database>();
  CvBloc() : super(CvInitial()) {
    on<addInfoEvent>(onAddInfo);
  }

  FutureOr<void> onAddInfo(addInfoEvent event, Emitter<CvState> emit) async {
    await locator.createData(
        event.name,
        event.title,
        event.address,
        event.company,
        event.email,
        event.degree,
        event.graduationYear,
        event.institution,
        event.jobTitle,
        event.language,
        event.period,
        event.phone,
        event.project,
        event.skill,
        event.summary,
        );
    emit(DisplayState());
  }
}
