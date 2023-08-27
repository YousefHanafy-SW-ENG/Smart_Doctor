import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'visit_screen_state.dart';

class VisitScreenCubit extends Cubit<VisitScreenStates> {
  VisitScreenCubit() : super(VisitscreenInitial());
  VisitScreenCubit getCubit(context) => BlocProvider.of(context);

  List<String> dateController = ['11/5/2021', '12/6/2022'];
  String typeController = AppStrings.inpatent;
  bool overLayWidgetIsOpen = false;
  void changeDateController({required String value}) {
    dateController[0] = value;
    emit(ChangeDateControllerSucessState());
  }

  void changeTypeController({required String value}) {
    typeController = value;
    emit(ChangeTypeControllerSucessState());
  }
}
