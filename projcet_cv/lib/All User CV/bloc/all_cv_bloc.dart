import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projcet_cv/model/cv.dart';
import 'package:projcet_cv/service/supabase_services.dart';

part 'all_cv_event.dart';
part 'all_cv_state.dart';

class AllCvBloc extends Bloc<AllCvEvent, AllCvState> {
  AllCvBloc() : super(AllCvInitial()) {
  on<DisplayAllCVEvent>(onDisplayCV);
  
  }
  

  FutureOr<void> onDisplayCV(DisplayAllCVEvent event, Emitter<AllCvState> emit)async {
    try {
      emit(SuccessAllCvState(await Database().FetchData()));
    } catch (e) {
      emit(ErrorState("There is Error"));
    }
  }
}


    
  