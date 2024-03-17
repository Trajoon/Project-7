import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:projcet_cv/model/cv.dart';
import 'package:projcet_cv/service/supabase_services.dart';

part 'c_vv_event.dart';
part 'c_vv_state.dart';

class CVvBloc extends Bloc<CVvEvent, CVvState> {
  final locator = GetIt.I.get<Database>();
  CVvBloc() : super(CVvInitial()) {
    on<DisplayCVEvent>(onDisplayCV);
    on<UpdateCVEvent>(onUpdateCV);
    on<DeleteCVEvent>(onDeleteCV);
  }

  FutureOr<void> onDisplayCV(
      DisplayCVEvent event, Emitter<CVvState> emit) async {
    try {
      emit(SuccessCvState(await Database().FetchData()));
    } catch (e) {
      emit(ErrorState("There is Error"));
    }
  }

  FutureOr<void> onUpdateCV(UpdateCVEvent event, Emitter<CVvState> emit) async {
    try {
      await Database().updateData(
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
          event.summary);
      emit(SuccessCvState(await Database().FetchData()));
    } catch (e) {
      emit(ErrorState("There is Error"));
    }
  }

  FutureOr<void> onDeleteCV(DeleteCVEvent event, Emitter<CVvState> emit) async {
    try {
      await Database().deleteData();
      emit(SuccessCvState(await Database().FetchData()));
    } catch (e) {
      emit(ErrorState("There is Error"));
    }
  }
}
